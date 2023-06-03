import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String domain;
  final String env;
  final String version;

  final String authorization;

  HttpService({
    required this.authorization,
    this.domain = 'api.mercadopago.com',
    this.env = '',
    this.version = '/v1',
  });

  Future<http.Response?> getWithCredentials({
    required String? path,
    Map<String, String>? queryStringParams,
  }) async {
    try {
      Uri url = Uri.https(
        domain,
        '$env$version$path',
        queryStringParams,
      );

      Future<http.Response> futureHttpResponse =
          http.get(url, headers: <String, String>{
        "Authorization": authorization,
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
    final Uri uri = Uri.https(domain, '$env$version$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http
        .post(uri,
            headers: {
              "Authorization": authorization,
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
    final Uri uri = Uri.https(domain, '$env$version$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http
        .put(uri,
            headers: {
              "Authorization": authorization,
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
    final Uri uri = Uri.https(domain, '$env$version$path', queryStringParams);
    Future<http.Response> futureHttpResponse = http.delete(
      uri,
      headers: {
        "Authorization": authorization,
        "Content-Type": "application/json"
      },
    ).then((dynamic response) {
      return response;
    }, onError: (e) {});
    return futureHttpResponse;
  }
}
