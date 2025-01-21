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
    required Map<String, String> queryParameters,
    required Response Function(Map<String, dynamic>) responseBuilder,
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
    http.Response response = await http.post(
      Uri.parse(url),
      headers: (header ?? Headers()).toJson(),
      body: jsonEncode(request),
    );

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
    required Map<String, String> queryParameters,
    required Response Function(Map<String, dynamic> p1) responseBuilder,
    Headers? header,
  }) async {
    http.Response response = await http.get(
      Uri.https(authority, path, queryParameters),
      headers: (header ?? Headers()).toJson(),
    );

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
}

// Future<http.Response> refreshTokenAndRetry({required String url, required Map<String, String> headers, required String body}) async {
//     RefreshTokenResponse? refreshTokenResponse = await GenerateTokenRepo().refreshToken(
//       RefreshTokenRequest(
//         requestedBy: SharedPref.getUserId(),
//         refreshToken: Headers.refreshToken,
//       ),
//     );
//     if (refreshTokenResponse?.errors == null) {
//       Headers.authorization = "Bearer ${refreshTokenResponse?.result?.accessToken.toString()}";
//       Headers.refreshToken = (refreshTokenResponse?.result?.refreshToken ?? '').toString();
//       return await http.post(Uri.parse(url), headers: headers, body: body);
//     } else {
//       sessionController.expireSession();
//       http.Response res = http.Response(jsonEncode(refreshTokenResponse?.errors), int.parse(refreshTokenResponse?.errors?.firstOrNull?.code ?? '0'));
//       return Future(() => res);
//     }
//   }
