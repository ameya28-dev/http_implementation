import 'dart:convert';
import 'api/api.dart';
import 'model/post/request.dart' as req;
import 'model/get/response.dart';
import 'model/post/response.dart';
import 'utils/urls.dart';

Future<void> main() async {
  List<GetResponse> res = await HttpMethod.instance.httpGetList(
    authority: BaseUrl.restful,
    path: '/${Endpoints.objects}',
    queryParameters: {
      'id': ['3', '5', '4']
    },
    responseBuilder: (json) => json.map((v) => GetResponse()..fromJson(v)).toList(),
  );
  print(jsonEncode(res));

  PostResponse response = await HttpMethod.instance.httpPost(
    url: 'https://${BaseUrl.restful}/${Endpoints.objects}gvhjmbk',
    request: req.PostRequest(
      name: 'Apple MacBook Pro 16',
      data: req.Data(
        year: 2019,
        price: 1499.9,
        cPUModel: 'Intel iCore 9',
        hardDiskSize: '1 TB',
      ),
    ),
    responseBuilder: (json) => PostResponse()..fromJson(json),
  );

  print(jsonEncode(response));
}
