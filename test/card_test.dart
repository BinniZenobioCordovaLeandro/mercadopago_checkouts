import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_by_binnicordova/mercadopago_checkouts.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cardholder.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cards.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/identification.dart';

String auth =
    'Bearer TEST-5314773940691692-052819-9810f4e245f146cf5c056b051fa41519-445803597';

void main() {
  test('tokenize a card', () async {
    Card card = const Card(
      cardNumber: '5031755734530604',
      cardholder: Cardholder(
        name: 'Roberto Gomez Bolañosqui',
        identification: Identification(
          number: '34127856',
          type: 'DNI',
        ),
      ),
      expirationYear: 2025,
      expirationMonth: 11,
      cvv: '123',
    );
    CardProvider cardProvider = CardProvider(authorization: auth);
    Card? tokenizedCard = await cardProvider.tokenCardCreate(card);
    expect(tokenizedCard?.id, isNot(equals(null)));
  });
}
