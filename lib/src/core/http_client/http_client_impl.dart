import 'package:dio/dio.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/shared/constants/endpoints.dart';

class HttpClientImpl implements HttpClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
    ),
  );

  @override
  Future<HttpResponse> get({required String endpoint}) async {
    final Response response = await dio.get(endpoint);

    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode ?? 200,
    );
  }

  @override
  Future<HttpResponse> post({
    required String endpoint,
    required dynamic body,
  }) async {
    final Response response = await dio.post(
      endpoint,
      data: body,
    );

    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode ?? 200,
    );
  }
}
