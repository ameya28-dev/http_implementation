import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/common/error.dart';
import '../model/get/response.dart';
import '../utils/headers.dart';
import '../model/common/model.dart';

abstract interface class IHttpMethod {
  Future<Response> httpPost<Request extends Model, Response extends Model>({
    required String url,
    required Request request,
    required Response Function(Map<String, dynamic>) responseBuilder,
    Headers? header,
  });

  Future<Response> httpGet<Response extends Model>({
    required String authority,
    required String path,
    required Map<String, dynamic> queryParameters,
    required Response Function(Map<String, dynamic>) responseBuilder,
    Headers? header,
  });

  Future<List<Response>> httpGetList<Response extends Model>({
    required String authority,
    required String path,
    required Map<String, dynamic> queryParameters,
    required List<Response> Function(List<Map<String, dynamic>>) responseBuilder,
    Headers? header,
  });
}

class HttpMethod implements IHttpMethod {
  static final HttpMethod _instance = HttpMethod._internal();

  static HttpMethod get instance => _instance;

  HttpMethod._internal();

  @override
  Future<Response> httpPost<Request extends Model, Response extends Model>({
    required String url,
    required Request request,
    required Response Function(Map<String, dynamic> p1) responseBuilder,
    Headers? header,
  }) async {
    http.Response response = await http.post(Uri.parse(url), headers: (header ?? Headers()).toJson(), body: jsonEncode(request));

    try {
      if ([200, 417, 424].contains(response.statusCode)) {
        return responseBuilder(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return responseBuilder(jsonDecode(response.body));
      } else {
        return responseBuilder(Errors(message: 'api failed').toJson());
      }
    } on Exception catch (ex) {
      return responseBuilder(Errors(message: ex.toString()).toJson());
    }
  }

  @override
  Future<Response> httpGet<Response extends Model>({
    required String authority,
    required String path,
    required Map<String, dynamic> queryParameters,
    required Response Function(Map<String, dynamic> p1) responseBuilder,
    Headers? header,
  }) async {
    http.Response response = await http.get(Uri.https(authority, path, queryParameters), headers: (header ?? Headers()).toJson());

    try {
      if ([200, 417, 424].contains(response.statusCode)) {
        return responseBuilder(jsonDecode(response.body)[0]);
      } else {
        return responseBuilder(Errors(message: 'api failed').toJson());
      }
    } on Exception catch (ex) {
      return responseBuilder(Errors(message: ex.toString()).toJson());
    }
  }

  @override
  Future<List<Response>> httpGetList<Response extends Model>({
    required String authority,
    required String path,
    required Map<String, dynamic> queryParameters,
    required List<Response> Function(List<Map<String, dynamic>> json) responseBuilder,
    Headers? header,
  }) async {
    http.Response response = await http.get(Uri.https(authority, path, queryParameters), headers: (header ?? Headers()).toJson());

    try {
      if ([200, 417, 424].contains(response.statusCode)) {
        return responseBuilder(jsonDecode(response.body).cast<Map<String, dynamic>>());
      } else {
        return responseBuilder([
          GetResponse(errors: [Errors(message: 'api failed')]).toJson()
        ]);
      }
    } on Exception catch (ex) {
      return responseBuilder([
        GetResponse(errors: [Errors(message: ex.toString())]).toJson()
      ]);
    }
  }
}
