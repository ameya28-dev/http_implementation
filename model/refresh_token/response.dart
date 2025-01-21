import '../common/error.dart';
import '../common/model.dart';

class RefreshTokenResponse implements Model {
  Result? result;
  List<Errors>? errors;

  RefreshTokenResponse({this.result, this.errors});

  @override
  void fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = Result.fromJson(json['Result']);
    } else {
      result = null;
    }
    if (json['Errors'] != null) {
      errors = <Errors>[];
      json['Errors'].forEach((v) {
        errors!.add(Errors()..fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['Result'] = result!.toJson();
    }
    if (errors != null) {
      data['Errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? accessToken;
  String? refreshToken;

  Result({this.accessToken, this.refreshToken});

  Result.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
