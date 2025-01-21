import '../common/model.dart';

class RefreshTokenRequest implements Model {
  String? refreshToken;
  String? requestedBy;

  RefreshTokenRequest({this.refreshToken, this.requestedBy});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refreshToken'] = refreshToken;
    data['RequestedBy'] = requestedBy;
    return data;
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    requestedBy = json['RequestedBy'];
  }
}
