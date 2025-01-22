import 'dart:convert';
import 'api/api.dart';
import 'logging/logging_utils.dart';
import 'model/post/request.dart' as req;
import 'model/get/response.dart';
import 'model/post/response.dart';
import 'utils/urls.dart';

void main()  {
  LoggingUtils.initialize();
  future1().then((res) => print('Time 1: $res'));
  future2().then((res) => print('Time 2: $res'));
}

Future<Duration> future2() async {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  final result = await Future.wait(
    [
      HttpMethod.instance.httpGetList(
        authority: BaseUrl.restful,
        path: '/${Endpoints.objects}blmkdslvms ',
        queryParameters: {
          'id': ['3', '5', '4']
        },
        responseBuilder: (json) => json.map((v) => GetResponse()..fromJson(v)).toList(),
      ),
      HttpMethod.instance.httpPost(
        url: 'https://${BaseUrl.restful}/${Endpoints.objects}',
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
      ),
    ],
  );

  for (var r in result) {
    LoggingUtils.info(jsonEncode(r));
  }
  stopwatch.stop();
  return stopwatch.elapsed;
}

Future<Duration> future1() async {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  List<GetResponse> res = await HttpMethod.instance.httpGetList(
    authority: BaseUrl.restful,
    path: '/${Endpoints.objects}blmkdslvms ',
    queryParameters: {
      'id': ['3', '5', '4']
    },
    responseBuilder: (json) => json.map((v) => GetResponse()..fromJson(v)).toList(),
  );

  LoggingUtils.info(jsonEncode(res));

  PostResponse response = await HttpMethod.instance.httpPost(
    url: 'https://${BaseUrl.restful}/${Endpoints.objects}',
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

  LoggingUtils.info(jsonEncode(response));
  stopwatch.stop();
  return stopwatch.elapsed;
}
