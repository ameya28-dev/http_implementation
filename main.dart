import 'dart:convert';
import 'api/api.dart';
import 'model/customer_profile/request.dart';
import 'model/customer_profile/response.dart';
import 'model/get/response.dart';
import 'utils/urls.dart';

Future<void> main() async {
  CustomerProfileResponse response = await HttpMethod.instance.httpPost<CustomerProfileRequest, CustomerProfileResponse>(
    url: Urls.getCustomerProfile,
    request: CustomerProfileRequest(
      businessCode: 'GL',
      userId: 'C211101',
      prospectNo: 'GL8782214',
    ),
    responseBuilder: (json) => CustomerProfileResponse()..fromJson(json),
  );

  print(jsonEncode(response));

  GetResponse res = await HttpMethod.instance.httpGet(
    authority: BaseUrl.restful,
    path: '/${Endpoints.objects}',
    queryParameters: {
      'id': '3',
      'id': '4',
      'id': '5',
    },
    responseBuilder: (json) => GetResponse()..fromJson(json),
  );
  print(jsonEncode(res));
}
