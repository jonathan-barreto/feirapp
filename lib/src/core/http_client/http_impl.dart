import 'package:dio/dio.dart';
import 'package:sabor_natural_app/src/core/http_client/http_client.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';

class HttpImpl implements HttpClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
    ),
  );

  @override
  Future<HttpResponse> get({required String endpoint}) async {
    final Response response = await dio.get(EndPoints.getAllProducts);

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
      EndPoints.getAllProducts,
      data: body,
    );

    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode ?? 200,
    );
  }
}
