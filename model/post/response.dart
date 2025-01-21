import '../common/model.dart';

class PostResponse implements Model {
  String? id;
  String? name;
  Data? data;
  String? createdAt;
  List<Errors>? errors;

  PostResponse({this.id, this.name, this.data, this.createdAt, this.errors});

  @override
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    createdAt = json['createdAt'];
    if (json['Errors'] != null) {
      errors = <Errors>[];
      json['Errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['createdAt'] = this.createdAt;
    if (this.errors != null) {
      data['Errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? year;
  double? price;
  String? cPUModel;
  String? hardDiskSize;

  Data({this.year, this.price, this.cPUModel, this.hardDiskSize});

  Data.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    price = json['price'];
    cPUModel = json['CPU model'];
    hardDiskSize = json['Hard disk size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['price'] = this.price;
    data['CPU model'] = this.cPUModel;
    data['Hard disk size'] = this.hardDiskSize;
    return data;
  }
}

class Errors {
  String? code;
  String? subStatusCode;
  String? severity;
  String? message;

  Errors({this.code, this.subStatusCode, this.severity, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    subStatusCode = json['SubStatusCode'];
    severity = json['Severity'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['SubStatusCode'] = this.subStatusCode;
    data['Severity'] = this.severity;
    data['Message'] = this.message;
    return data;
  }
}
