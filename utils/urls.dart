abstract class Urls {
  static const String getCustomerProfile = 'https://${BaseUrl.uat}/${Controller.demographics}/${Endpoints.getCustomerProfile}';
  static const String refreshToken = 'https://${BaseUrl.uat}/${Controller.token}/${Endpoints.refresh}';
}

abstract class BaseUrl {
  static const String uat = 'apiuat.iifl.in';
  static const String restful = 'api.restful-api.dev';
}

abstract class Controller {
  static const String demographics = 'GLDemographics';
  static const String token = 'Token/v3';
}

abstract class Endpoints {
  static const String getCustomerProfile = 'GetCustomerProfile';
  static const String refresh = 'Refresh';
  static const String objects = 'objects';
}
