import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/common/error.dart';
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
    required Response Function(Map<String, dynamic> json) responseBuilder,
    Headers? header,
  }) async {
    http.Response response = await http.post(Uri.parse(url), headers: (header ?? Headers()).toJson(), body: jsonEncode(request));

    try {
      if ([200, 417, 424].contains(response.statusCode)) {
        return responseBuilder(jsonDecode(response.body));
      } else {
        return responseBuilder(_buildError(message: 'api failed', severity: 'serious'));
      }
    } on Exception catch (ex) {
      return responseBuilder(_buildError(message: ex.toString()));
    }
  }

  Map<String, dynamic> _buildError({String? code, String? subStatusCode, String? message, String? severity}) => {
        'Errors': [Errors(code: code, subStatusCode: subStatusCode, message: message, severity: severity).toJson()]
      };

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
        return responseBuilder(_buildError(message: 'api failed'));
      }
    } on Exception catch (ex) {
      return responseBuilder(_buildError(message: ex.toString()));
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
        return responseBuilder([_buildError(message: 'api failed')]);
      }
    } on Exception catch (ex) {
      return responseBuilder([_buildError(message: ex.toString())]);
    }
  }
}
