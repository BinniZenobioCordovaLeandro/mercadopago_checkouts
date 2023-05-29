### I'm Binni Cordova, a Great Programmer

# MERCADOPAGO checkouts

I'm currenlu using this package on my ecommerces for proccess payments with cards.

## Contributions

Just call me to develop your project 💪🧑‍💻 and send me some money 💰💵💲 to support this report and update it.

[![binnicordova.com](./resources/recent_works.png)](https://binnicordova.com/)

ALSO, buy me fives coffees ☕️ 👀 to my 🧠🎸

[![name](./resources/bmc_qr.png)](https://www.buymeacoffee.com/binnicordova)

## Issues

Please file any issues, bugs, or feature requests in this repository.

## Features

- [*] Create customer
- [*] Search customer
- [ ] Delete customer

- [*] list cards
- [*] tokenize cards
- [*] save cards
- [*] delete cards

- [*] pay order

## Getting started

EASY AND SIMPLE!

## Usage

I wrote a nice UNIT TEST to simulate an order payment, you can read it on `test/mercadopago_checkouts_test`

```dart
String auth =
    'Bearer TEST-5314773940691692-052819-9810f4e245f146cf5c056b051fa41519-445803597';

PaidMarketProvider paidMarketProvider = PaidMarketProvider(
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
Map? response = await paidMarketProvider.customerCardTokenCreate(
  dataCard: card,
  email: user.email,
);
Card tokenizedCard = response!['data'] as Card;
expect(tokenizedCard.id, isNot(equals(null)));

// PAY ORDER
final PaymentResponseModel? paymentResponseModel =
    await paidMarketProvider.payOrder(
  dataCard: tokenizedCard,
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
  expect(
    paymentResponseModel?.statusDetail,
    isNot(equals(PaidMarketStatusTypeEnum.Accredited.value)),
  );
  expect(
    paymentResponseModel?.statusDetail,
    isNot(equals(PaidMarketStatusTypeEnum.PendingContingency.value)),
  );
  expect(
    paymentResponseModel?.statusDetail,
    isNot(equals(PaidMarketStatusTypeEnum.PendingReviewManual.value)),
  );
}

// DELETE CARD (only if necesary)
if (tokenizedCard.save == false) {
  paidMarketProvider.customerCardDelete(dataCard: tokenizedCard);
}
```

## Copyright

Copyright (c) 2023 Binni Cordova
See LICENSE for details