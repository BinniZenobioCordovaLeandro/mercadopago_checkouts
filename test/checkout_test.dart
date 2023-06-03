import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_by_binnicordova/mercadopago_checkouts.dart';
import 'package:mercadopago_by_binnicordova/src/enums/paid_market_status_type_enum.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cardholder.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cards.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/customer_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/identification.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/payment_response_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/user_model.dart';

String auth =
    'Bearer TEST-5314773940691692-052819-9810f4e245f146cf5c056b051fa41519-445803597';

void main() {
  test('search not register customer', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: faker.internet.email(),
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );

    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel, equals(null));
  });

  test('search register customer', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );

    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel?.id, isNot(equals(null)));
  });

  test('create customer', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );

    CustomerModel? customerModel =
        await paidMarketProvider.customerCreate(userModel: user);

    expect(
      customerModel?.id,
      isNot(equals(null)),
    );
  });

  test('create customer card', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );

    // SEARCH CUSTOMER
    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel?.id, isNot(equals(null)));

    // CARD
    Card card = Card(
      id: null, // if this is defined so is a saved card
      customerId: customerModel!.id,
      cardNumber: '5031755734530604',
      cardholder: Cardholder(
        name: '${user.firstName} ${user.lastName}',
        identification: Identification(
          number: user.document,
          type: user.idCountriesDocumentsTypes,
        ),
      ),
      expirationYear: 2025,
      expirationMonth: 11,
      cvv: '123',
    );
    Map? response = await paidMarketProvider.customerCardTokenCreate(
      dataCard: card,
      email: user.email,
    );

    print(response);

    Card tokenizedCard = response!['data'] as Card;

    expect(
      tokenizedCard.id,
      isNot(equals(null)),
    );
  });

  test('list customer cards', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );

    // SEARCH CUSTOMER
    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel?.cards, isList);
  });

  test('pay order with new card', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );
    String orderUID = 'order-321';
    double orderAmount = 100.00;

    // SEARCH CUSTOMER
    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel?.id, isNot(equals(null)));

    // CARD
    Card card = Card(
      id: null, // if this is defined so is a saved card
      save: false,
      installments: 1,
      customerId: customerModel!.id,
      cardNumber: '5031755734530604',
      cardholder: Cardholder(
        name: '${user.firstName} ${user.lastName}',
        identification: Identification(
          number: user.document,
          type: user.idCountriesDocumentsTypes,
        ),
      ),
      expirationYear: 2025,
      expirationMonth: 11,
      cvv: '123',
    );

    Card? tokenizedCard =
        await CardProvider(authorization: auth).tokenCardCreate(card);

    expect(tokenizedCard?.id, isNot(equals(null)));

    // PAY ORDER
    final PaymentResponseModel? paymentResponseModel =
        await paidMarketProvider.payOrder(
      dataCard: tokenizedCard!,
      userModel: user,
      orderNumber: orderUID,
      amount: orderAmount,
    );

    if (paymentResponseModel?.statusDetail ==
        PaidMarketStatusTypeEnum.Accredited.value) {
      expect(paymentResponseModel?.statusDetail,
          equals(PaidMarketStatusTypeEnum.Accredited.value));
    } else if (paymentResponseModel?.statusDetail ==
            PaidMarketStatusTypeEnum.PendingContingency.value ||
        paymentResponseModel?.statusDetail ==
            PaidMarketStatusTypeEnum.PendingReviewManual.value) {
      expect(
        paymentResponseModel?.statusDetail,
        equals(PaidMarketStatusTypeEnum.PendingContingency.value),
      );
    } else {
      throw ErrorDescription('${paymentResponseModel?.statusDetail}');
    }

    // DELETE CARD (only if necesary)
    if (tokenizedCard.save == false) {
      paidMarketProvider.customerCardDelete(dataCard: tokenizedCard);
    }
  });

  test('pay order with saved card', () async {
    CheckoutProvider paidMarketProvider = CheckoutProvider(
      authorization: auth,
    );

    UserModel user = const UserModel(
      firstName: 'Raul',
      lastName: 'Romero Diaz',
      document: '34127856',
      email: 'bin@gmail.com',
      idCountriesCodes: 'PE',
      phoneCode: "+51",
      phoneNumber: '987654321',
      idCountriesDocumentsTypes: 'DNI',
    );
    String orderUID = 'order-321';
    double orderAmount = 100.00;

    // SEARCH CUSTOMER
    CustomerModel? customerModel =
        await paidMarketProvider.customerSearch(userModel: user);

    expect(customerModel?.cards?[0], isA<Card>());

    // CARD
    Card card = customerModel?.cards?[0];

    Card? tokenizedCard =
        await CardProvider(authorization: auth).tokenCardCreate(
      card.copyWith(cvv: '123'),
    );

    expect(tokenizedCard?.id, isNot(equals(null)));

    // PAY ORDER
    final PaymentResponseModel? paymentResponseModel =
        await paidMarketProvider.payOrder(
      dataCard: tokenizedCard!,
      userModel: user,
      orderNumber: orderUID,
      amount: orderAmount,
    );

    if (paymentResponseModel?.statusDetail ==
        PaidMarketStatusTypeEnum.Accredited.value) {
      expect(paymentResponseModel?.statusDetail,
          equals(PaidMarketStatusTypeEnum.Accredited.value));
    } else if (paymentResponseModel?.statusDetail ==
            PaidMarketStatusTypeEnum.PendingContingency.value ||
        paymentResponseModel?.statusDetail ==
            PaidMarketStatusTypeEnum.PendingReviewManual.value) {
      expect(
        paymentResponseModel?.statusDetail,
        equals(PaidMarketStatusTypeEnum.PendingContingency.value),
      );
    } else {
      throw ErrorDescription('${paymentResponseModel?.statusDetail}');
    }
  });
}
