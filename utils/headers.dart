class Headers {
  static String get clientId => '0dff5568454f4a4eb668e25a225a3452';

  static String get aPIVersion => 'V1';

  static String appVersion = 'V1';

  static String get ocpApimSubscriptionKey => '0dff5568454f4a4eb668e25a225a3452';

  static String contentType = 'application/json';
  static String authorization =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJSZXF1ZXN0ZWRCeSI6IkMyMTExMDEiLCJBcHBOYW1lIjoiTW9iaVRyYWlsIiwibmJmIjoxNzM3NDYxNjI5LCJleHAiOjE3Mzc0Njg4MjksImlzcyI6Imh0dHBzOi8vZ2x1YXQuaWlmbC5pbiIsImF1ZCI6IkMyMTExMDEuTW9iaVRyYWlsIn0.7WhBr7dBZr9PUC_e2giZ-Sp_091ZlNA266dAnfmZgBA';
  static String refreshToken = '';
  static String hMAC = '';

  Map<String, String> toJson({String? apiVersion, String? hmac}) {
    final Map<String, String> data = <String, String>{};
    data['ApiVersion'] = apiVersion ?? aPIVersion;
    data['AppVersion'] = appVersion;
    data['Ocp-Apim-Subscription-Key'] = ocpApimSubscriptionKey;
    data['Content-Type'] = contentType;
    data['Authorization'] = authorization;
    data['HMAC'] = hmac ?? hMAC;
    return data;
  }
}
