import '../common/error.dart';
import '../common/model.dart';

class CustomerProfileResponse implements Model {
  Result? result;
  List<Errors>? errors;

  CustomerProfileResponse({this.result, this.errors});

  @override
  void fromJson(Map<String, dynamic> json) {
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
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
  String? cUID;
  String? activeProspects;
  String? currentPOS;
  String? name;
  String? fatherName;
  String? motherName;
  String? pANNumber;
  String? aadhaarNumber;
  String? currentAddress;
  String? permanentAddress;
  String? kYCDocuments;
  String? cKYCNumber;

  Result(
      {this.cUID,
      this.activeProspects,
      this.currentPOS,
      this.name,
      this.fatherName,
      this.motherName,
      this.pANNumber,
      this.aadhaarNumber,
      this.currentAddress,
      this.permanentAddress,
      this.kYCDocuments,
      this.cKYCNumber});

  Result.fromJson(Map<String, dynamic> json) {
    cUID = json['CUID'];
    activeProspects = json['ActiveProspects'];
    currentPOS = json['CurrentPOS'];
    name = json['Name'];
    fatherName = json['FatherName'];
    motherName = json['MotherName'];
    pANNumber = json['PANNumber'];
    aadhaarNumber = json['AadhaarNumber'];
    currentAddress = json['CurrentAddress'];
    permanentAddress = json['PermanentAddress'];
    kYCDocuments = json['KYCDocuments'];
    cKYCNumber = json['CKYCNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CUID'] = cUID;
    data['ActiveProspects'] = activeProspects;
    data['CurrentPOS'] = currentPOS;
    data['Name'] = name;
    data['FatherName'] = fatherName;
    data['MotherName'] = motherName;
    data['PANNumber'] = pANNumber;
    data['AadhaarNumber'] = aadhaarNumber;
    data['CurrentAddress'] = currentAddress;
    data['PermanentAddress'] = permanentAddress;
    data['KYCDocuments'] = kYCDocuments;
    data['CKYCNumber'] = cKYCNumber;
    return data;
  }
}
