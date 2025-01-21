import '../common/model.dart';

class PostRequest implements Model{
  String? name;
  Data? data;

  PostRequest({this.name, this.data});

  @override
  void fromJson(Map<String, dynamic> json) {
    name = json['name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
