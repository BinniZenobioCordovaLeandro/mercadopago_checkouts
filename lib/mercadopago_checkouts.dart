library mercadopago_checkouts;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mercadopago_by_binnicordova/src/models/card_type_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/cards.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/customer_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/paid_market_models/payment_response_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/payer_cost_model.dart';
import 'package:mercadopago_by_binnicordova/src/models/user_model.dart';

class PaidMarketProvider {
  final String domain = 'api.mercadopago.com';
  final String env = '';
  final String version = '/v1';

  final String authorization;

  Map codes = {
    'accredited':
        'Muchas gracias por preferirnos. Tu pago ha sido procesado. En los movimientos de tarjeta verás el cargo de TRANSACTION_AMOUNT como STATEMENT_DESCRIPTOR.',
    'pending_contingency':
        'Paciencia, estamos esperando la respuesta del banco operador. Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
    'pending_review_manual':
        'Paciencia, estamos procesando tu pago. No te preocupes, en un máximo de 2 días hábiles te avisaremos por e-mail si se acreditó tu pago o si necesitamos más información. ¿Preguntas?  ¿Dudas?  Contáctanos al chat ',
    'cc_rejected_bad_filled_card_number':
        'Ups! Revisa el número de tu tarjeta. ¿Ayuda?  Contáctanos al chat ',
    'cc_rejected_bad_filled_date':
        'Te recomendamos revisar la fecha de vencimiento de tu tarjeta. Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
    'cc_rejected_bad_filled_other':
        'Te recomendamos revisar los datos ingresados de tu tarjeta. Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
    'cc_rejected_bad_filled_security_code':
        'Te recomendamos revisar el código de seguridad de tu tarjeta. Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
    'cc_rejected_blacklist':
        '''Lo sentimos, no pudimos procesar tu pago. ¿Ayuda?  Contáctanos al chat ',
        // 'cc_rejected_call_for_authorize': 'Debes autorizar ante PAYMENT_METHOD_ID el pago de TRANSACTION_AMOUNT. Por favor contáctate con tu banco al: 
        'cc_rejected_call_for_authorize': 'Debes autorizar ante PAYMENT_METHOD_ID el pago de TRANSACTION_AMOUNT. Te recomendamos contactar al banco de tu tarjeta para autorizar las compras por internet. 
        Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
        'cc_rejected_card_disabled': 'Llama a PAYMENT_METHOD_ID para activar tu tarjeta o usa otro medio de pago. El teléfono se encuentra al dorso de tu tarjeta o intenta los siguientes números: 
        BANCO DE CREDITO BCP
        (01) 311-9898
        BBVA
        (01) 595-0000 
        INTERBANK
        (01) 311 9000 (Lima)
        00 801 0 0802 (Provincia)
        SCOTIABANK
        (01) 311 6000 (Lima)
        00 801 1 6000 (Provincia)
        ¿Aun necesitas ayuda?  Contáctanos al chat ''',
    'cc_rejected_card_error':
        '''Ups! No pudimos procesar tu pago.  Te recomendamos contactar a tu banco al teléfono:  
        BANCO DE CREDITO BCP
        (01) 311-9898
        BBVA
        (01) 595-0000 
        INTERBANK
        (01) 311 9000 (Lima)
        00 801 0 0802 (Provincia)
        SCOTIABANK
        (01) 311 6000 (Lima)
        00 801 1 6000 (Provincia)
        ¿Ayuda?  Contáctanos al chat ''',
    'cc_rejected_duplicated_payment':
        'Ya hiciste un pago por ese valor. Si necesitas volver a pagar, usa otra tarjeta u otro medio de pago. ¿Ayuda?  Contáctanos al chat ',
    'cc_rejected_high_risk':
        '''Lo sentimos, tu pago fue rechazado.  Por favor, contáctate con tu banco: 
        BANCO DE CREDITO BCP
        (01) 311-9898
        BBVA
        (01) 595-0000 
        INTERBANK
        (01) 311 9000 (Lima)
        00 801 0 0802 (Provincia)
        SCOTIABANK
        (01) 311 6000 (Lima)
        00 801 1 6000 (Provincia)
        Elige otro de los medios de pago, te recomendamos pagos en efectivo. ¿Ayuda?  Contáctanos al chat ''',
    'cc_rejected_insufficient_amount':
        '''Tu PAYMENT_METHOD_ID no cuenta con fondos suficientes para realizar esta compra. Te recomendamos utilizar otro medio de pago.
        Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
        'cc_rejected_invalid_installments': 'Lo sentimos, PAYMENT_METHOD_ID no procesa pagos en installments cuotas. ¿Ayuda?  Contáctanos al chat ',
        'cc_rejected_max_attempts': 'Llegaste al límite de intentos permitidos. Te recomendamos usar otra tarjeta u otro medio de pago. ¿Ayuda?  Contáctanos al chat ''',
    'cc_rejected_other_reason':
        'Lo sentimos. PAYMENT_METHOD_ID no ha logrado procesar el pago. Intenta nuevamente. Para más información, comunícate con nosotros al chat o al (511) 500 0460.',
    'e204': 'El mes de expiración es inválido.',
    'e205': 'El año de expiración es inválido.',
    'e202': 'Número de tarjeta invalido. Invalid card_number',
    '324': 'Número de DNI invalido. Invalid cardholder.identification.number',
    '316':
        'Nombre del titular de la tarjeta invalido. Invalid Value for Field: cardholder.name',
    'card-106':
        'El nombre registrado en la tarjeta tiene caracteres no validos. Invalid token. Invalid parameter cardholderName, characters are not valid.',
    //TODO: flutter2.x Pedro: agregar erorr de usuario de prueba usando tarjeta
  };

  PaidMarketProvider({
    required this.authorization,
  });

  Future<http.Response?> getWithCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
  }) async {
    try {
      Uri url = Uri.https(
        domain,
        '${this.env}${this.version}$path',
        queryStringParams,
      );

      Future<http.Response> futureHttpResponse =
          http.get(url, headers: <String, String>{
        "Authorization": this.authorization,
      }).then((dynamic response) {
        return response;
      }, onError: (e) {});
      return futureHttpResponse;
    } catch (e) {
      return null;
    }
  }

  Future<http.Response> postWithoutCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
    dynamic body,
  }) {
    final Uri uri = Uri.https(domain, '$env/$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http
        .post(uri,
            headers: {
              "Authorization":
                  "Basic YXBwc0BwbGF0YW5pdG9zLmNvbTpNVjJdRUdXfm0qMi1bK2pqQntsRw==",
              "Content-Type": "application/json"
            },
            body: jsonEncode(body))
        .then((dynamic response) {
      return response;
    }, onError: (e) {});
    return futureHttpResponse;
  }

  Future<http.Response> postWithCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
    dynamic body,
  }) {
    final Uri uri =
        Uri.https(domain, '${this.env}${this.version}$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http
        .post(uri,
            headers: {
              "Authorization": this.authorization,
              "Content-Type": "application/json"
            },
            body: jsonEncode(body))
        .then((dynamic response) {
      return response;
    }, onError: (e) {});
    return futureHttpResponse;
  }

  Future<http.Response> putWithCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
    dynamic body,
  }) {
    final Uri uri =
        Uri.https(domain, '${this.env}${this.version}$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http
        .put(uri,
            headers: {
              "Authorization": this.authorization,
              "Content-Type": "application/json"
            },
            body: jsonEncode(body))
        .then((dynamic response) {
      return response;
    }, onError: (e) {});
    return futureHttpResponse;
  }

  Future<http.Response> deleteWithCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
    dynamic body,
  }) {
    final Uri uri =
        Uri.https(domain, '${this.env}${this.version}$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http.delete(
      uri,
      headers: {
        "Authorization": this.authorization,
        "Content-Type": "application/json"
      },
    ).then((dynamic response) {
      return response;
    }, onError: (e) {});
    return futureHttpResponse;
  }

  payments() {
    return 'payments';
  }

  paymentsSearch() {
    return 'paymentsSearch';
  }

  Future<CustomerModel?> customerSearch({
    required UserModel? userModel,
    String path = "/customers/search",
  }) {
    final Map<String, String> queryStringParams = {
      'email': '${userModel?.email}',
    };
    Future<CustomerModel?> futureCustomerModel = this
        .getWithCredentials(path: path, queryStringParams: queryStringParams)
        .then((http.Response? response) {
      if (response?.statusCode == 200) {
        final decodeData = json.decode(response!.body);
        if (decodeData['results'] != null &&
            decodeData['results'].runtimeType.toString().contains('List') &&
            decodeData['results'].length > 0) {
          dynamic data = decodeData['results'][0];

          if (data['cards'].length > 1) {
            String? defaultCard = data['default_card'];
            for (var x = 0; x < data['cards'].length; x++) {
              if (defaultCard == data['cards'][x]['id']) {
                dynamic first = (data['cards'] as List).removeAt(x);
                (data['cards'] as List).add(first);
              }
            }
          }
          CustomerModel customerModel = new CustomerModel.fromJson(
            data,
          );
          return customerModel;
        }
        return null;
      }
      return null;
    });
    return futureCustomerModel;
  }

  Future<CustomerModel?> customerCreate({
    required UserModel? userModel,
  }) {
    final String path = "/customers";
    final Map<String, dynamic> body = {
      'email': userModel?.email,
      'first_name': userModel?.firstName,
      'last_name': userModel?.lastName,
      'phone': {
        "area_code": userModel?.phoneCode,
        "number": userModel?.phoneNumber,
      },
      'identification': {
        "type": userModel?.idCountriesDocumentsTypes ?? 'DNI',
        "number": userModel?.document,
      },
    };
    Future<CustomerModel?> futureCustomerModel = this
        .postWithCredentials(path: path, body: body)
        .then((http.Response response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeData = json.decode(response.body);
        if (decodeData != null) {
          CustomerModel customerModel = new CustomerModel.fromJson(decodeData);
          return customerModel;
        }
      }
      return null;
    });
    return futureCustomerModel;
  }

  Future<Card?> customerCardCreate({
    required Card? dataCard,
    required token,
  }) {
    final String path = "/customers/${dataCard?.customerId}/cards";
    final Map<String, dynamic> body = {
      'token': token,
    };

    Future<Card?> futureCustomerModel = this
        .postWithCredentials(path: path, body: body)
        .then((http.Response response) {
      final decodeData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodeData != null) {
          final card = Card.fromJson(decodeData);
          return card;
        }
      } else if (response.statusCode == 400 &&
          decodeData != null &&
          decodeData['cause'] != null) {
        final msg = _readErrorCode(decodeData, 'leyendo la tarjeta');
        final card = new Card(
          error: msg,
        );
        return card;
      }
      return null;
    });
    return futureCustomerModel;
  }

  Future<Map?> customerCardTokenCreate({
    required Card? dataCard,
    required email,
  }) {
    final String path = "/card_tokens";
    Map<String, dynamic> body = {};
    if (dataCard?.id != null) {
      body = {"cardId": dataCard?.id, "securityCode": dataCard?.cvv};
    } else {
      body = {
        "cardNumber": dataCard?.cardNumber,
        // "email": email,
        "cardholder": dataCard?.cardholder?.toJson(),
        // "cardholder": {"name": "APRO"},
        // "issuer": {"name": "APRO"},
        "expirationYear": dataCard?.expirationYear,
        "expirationMonth": dataCard?.expirationMonth,
        "securityCode": dataCard?.cvv
      };
    }

    Future<Map?> futureCustomerModel = this
        .postWithCredentials(path: path, body: body)
        .then((http.Response response) async {
      final decodeData = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodeData != null && decodeData['id'] != null) {
          if (dataCard?.id != null) {
            Card newCard = dataCard!.copyWith(token: decodeData['id']);
            return {
              'success': true,
              'data': newCard,
            };
          } else {
            Card? card = await customerCardCreate(
              dataCard: dataCard,
              token: decodeData['id'],
            );
            if (card != null && card.id != null) {
              Card newCard = card.copyWith(token: decodeData['id']);
              return {'success': true, 'data': newCard};
            } else if (card != null && card.error != null) {
              return {
                'success': false,
                'msg': card.error,
                'data': dataCard,
              };
            }
            return null;
          }
        }
      }
      final msg = _readErrorCode(decodeData, 'leyendo la tarjeta');
      return {
        'success': false,
        'msg': msg,
        'data': dataCard,
      };
    });
    return futureCustomerModel;
  }

  Future<PaymentResponseModel?> payOrder({
    required Card? dataCard,
    required UserModel? userModel,
    required String? orderNumber,
    required double amount,
  }) {
    final String path = "/payments";
    Map<String, dynamic> body = {
      "transaction_amount": amount,
      "token": dataCard?.token,
      "notification_url": "https://binnicordova.com/retorno",
      "installments": dataCard?.installments ?? 1,
      "payment_method_id": dataCard?.paymentMethod?.id,
      "description": "Compra en https://binnicordova.com Flutter",
      "payer": {
        "id": dataCard?.customerId,
        "identification": {
          "number": userModel?.document,
          "type": "DNI",
        }
      },
      "external_reference": orderNumber,
      "additional_info": {
        "payer": {
          "first_name": userModel?.firstName,
          "last_name": userModel?.lastName,
          "registration_date": "",
          "phone": {
            "area_code": userModel?.idCountriesCodes,
            "number": userModel?.phoneNumber
          }
        },
      }
    };

    Future<PaymentResponseModel?> futurePaymentResponseModel = this
        .postWithCredentials(path: path, body: body)
        .then((http.Response response) {
      final decodeData = json.decode(response.body);
      if (decodeData != null &&
          (decodeData['id'] != null || decodeData['message'] != null)) {
        final PaymentResponseModel paymentResponseModel =
            PaymentResponseModel.fromJson(decodeData);
        return paymentResponseModel;
      }
      // }
      return null;
    });
    return futurePaymentResponseModel;
  }

  Future<void> customerCardDelete({
    required Card? dataCard,
  }) {
    final String path =
        "/customers/${dataCard?.customerId}/cards/${dataCard?.id}";

    final request = this
        .deleteWithCredentials(path: path)
        .then((http.Response response) {});
    return request;
  }

  String _readErrorCode(Map response, String action) {
    String code;
    if (response['cause'] != null && response['cause'].length > 0) {
      if (response['cause'][0] is List) {
        code = response['cause'][0][0]['code'].toString().toLowerCase();
      } else {
        code = response['cause'][0]['code'].toString().toLowerCase();
      }
    } else if (response['status_detail'] != null) {
      code = response['status_detail'].toString().toLowerCase();
    } else {
      code = 'default';
    }
    if (this.codes[code] != null) {
      return this.codes[code];
    } else {
      return "Ocurrio un error $action, por favor reintenta.";
    }
  }

  Future<List<dynamic>?> getIdentificationTypes({int idTaxonomies = 0}) async {
    final path = '/identification_types';

    Future<List<dynamic>?> dataIdentificationTypes = getWithCredentials(
      path: path,
    ).then(
      (http.Response? response) {
        if (response?.statusCode == 200) {
          List<dynamic> decodeData = json.decode(response!.body);
          return decodeData;
        }
        return null;
      },
    );

    return dataIdentificationTypes;
  }

  Future<CustomerModel?> updatedDefaultCard({
    required String idUser,
    required String idCard,
  }) {
    final String path = "/customers/$idUser";

    Map<String, dynamic> body = {
      'default_card': idCard,
    };
    Future<CustomerModel?> futureCustomerModel = this
        .putWithCredentials(path: path, body: body)
        .then((http.Response response) {
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body);
        dynamic data = decodeData;
        if (data['cards'].length > 1) {
          String defaultCard = data['default_card'];
          for (var x = 0; x < data['cards'].length; x++) {
            if (defaultCard == data['cards'][x]['id']) {
              dynamic first = (data['cards'] as List).removeAt(x);
              (data['cards'] as List).add(first);
            }
          }
        }
        CustomerModel customerModel = new CustomerModel.fromJson(
          data,
        );
        return customerModel;
      }
      return null;
    });
    return futureCustomerModel;
  }

  Future<CardTypeModel?> getInstallmentsCard({required String bins}) {
    final Map<String, String> queryStringParams = {
      'marketplace': 'NONE',
      'status': 'active',
      'js_version': '1.3.1',
      'bins': bins,
      'referer': 'https://binnicordova.com'
    };
    final String path = "/payment_methods/search";
    final Future<CardTypeModel?> futureCardTypeModel = this
        .getWithCredentials(path: path, queryStringParams: queryStringParams)
        .then((http.Response? response) {
      if (response?.statusCode == 200) {
        final decodeData = json.decode(response!.body);
        if (decodeData['results'] is List) {
          CardTypeModel cardTypeModel =
              new CardTypeModel.fromJson(decodeData['results'][0]);
          return cardTypeModel;
        }
        return null;
      }
      return null;
    });
    return futureCardTypeModel;
  }

  Future<List<PayerCostModel?>?> getPayerCostCard({
    required String paymentMethodid,
    required int issuerId,
    required double amount,
  }) {
    final Map<String, String> queryStringParams = {
      'js_version': '1.3.1',
      'payment_method_id': paymentMethodid,
      'issuer.id': '$issuerId',
      'amount': '$amount',
      'locale': 'es',
      'referer': 'https://binnicordova.com'
    };
    final String path = "/payment_methods/installments";
    final Future<List<PayerCostModel?>?> futurePayerCostModel = this
        .getWithCredentials(path: path, queryStringParams: queryStringParams)
        .then((http.Response? response) {
      try {
        if (response?.statusCode == 200 && amount > 1) {
          final decodeData = json.decode(response!.body);
          List<PayerCostModel> listPayerCostModel =
              List<PayerCostModel>.empty(growable: true);
          if (decodeData?[0]?['payer_costs'] != null)
            for (var i = 0; i < decodeData[0]['payer_costs'].length; i++) {
              listPayerCostModel.add(
                  PayerCostModel.fromJson(decodeData[0]['payer_costs'][i]));
            }
          return listPayerCostModel;
        }
      } catch (e) {
        print(e);
      }
      return null;
    });
    return futurePayerCostModel;
  }

  Future<Card?> tokenCardCreate(Card? cards) {
    final String path = "/card_tokens";
    Map<String, dynamic> body = {
      "cardNumber": cards?.cardNumber,
      // "email": email,
      "cardholder": cards?.cardholder?.toJson(),
      // "cardholder": {"name": "APRO"},
      // "issuer": {"name": "APRO"},
      "expirationYear": cards?.expirationYear,
      "expirationMonth": cards?.expirationMonth,
      "securityCode": cards?.cvv
    };

    Future<Card?> futureCards = this
        .postWithCredentials(path: path, body: body)
        .then((http.Response response) {
      final decodeData = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodeData != null && decodeData['id'] != null) {
          final Card newCard = Card.fromJson(decodeData);
          return newCard;
        }
        return null;
      }
      return null;
    });

    return futureCards;
  }
}
