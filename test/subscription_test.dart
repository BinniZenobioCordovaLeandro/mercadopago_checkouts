import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_by_binnicordova/mercadopago_checkouts.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cardholder.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cards.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/customer_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/identification.dart';
import 'package:mercadopago_by_binnicordova/src/models/user_model.dart';

String auth =
    'Bearer TEST-5314773940691692-052819-9810f4e245f146cf5c056b051fa41519-445803597';

void main() {
  test('create plan', () async {
    SubscriptionProvider subscriptions =
        SubscriptionProvider(authorization: auth);

    String? planId =
        await subscriptions.createPlan(reason: 'gold_suscription', amount: 100);

    expect(planId, isNot(equals(null)));
  });

  test('create suscription to plan', () async {
    SubscriptionProvider subscriptions =
        SubscriptionProvider(authorization: auth);
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

    Card? tokenizedCard =
        await CardProvider(authorization: auth).tokenCardCreate(
      card.copyWith(cvv: '123'),
    );

    // PLAN
    String? planId =
        await subscriptions.createPlan(reason: 'gold_suscription', amount: 100);

    // SUSCRIPTION
    String? userSuscriptionId = await subscriptions.createSubscription(
      reason: 'gold_suscription_service',
      planId: planId!,
      externalReference: 'uid',
      userModel: user,
      card: tokenizedCard!,
    );

    expect(userSuscriptionId, isNot(equals(null)));
  });
}
