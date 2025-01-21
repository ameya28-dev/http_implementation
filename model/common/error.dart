import 'model.dart';

class Errors implements Model {
  String? code;
  String? subStatusCode;
  String? severity;
  String? message;

  Errors({this.code, this.subStatusCode, this.severity, this.message});

  @override
  void fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    subStatusCode = json['SubStatusCode'];
    severity = json['Severity'];
    message = json['Message'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['SubStatusCode'] = subStatusCode;
    data['Severity'] = severity;
    data['Message'] = message;
    return data;
  }
}