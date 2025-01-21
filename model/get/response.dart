import '../common/error.dart';
import '../common/model.dart';

class GetResponse implements Model {
  String? id;
  String? name;
  Data? data;
  List<Errors>? errors;

  GetResponse({this.id, this.name, this.data, this.errors});

  @override
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['Errors'] != null) {
      errors = <Errors>[];
      json['Errors'].forEach((v) {
        errors!.add(Errors()..fromJson(v));
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
    if (errors != null) {
      data['Errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? color;
  int? capacityGB;

  Data({this.color, this.capacityGB});

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    capacityGB = json['capacity GB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['capacity GB'] = this.capacityGB;
    return data;
  }
}
