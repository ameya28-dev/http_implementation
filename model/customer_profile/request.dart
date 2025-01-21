import '../common/model.dart';

class CustomerProfileRequest implements Model {
  String? businessCode;
  String? userId;
  String? prospectNo;

  CustomerProfileRequest({this.businessCode, this.userId, this.prospectNo});

  @override
  void fromJson(Map<String, dynamic> json) {
    businessCode = json['BusinessCode'];
    userId = json['UserId'];
    prospectNo = json['ProspectNo'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessCode'] = this.businessCode;
    data['UserId'] = this.userId;
    data['ProspectNo'] = this.prospectNo;
    return data;
  }
}