import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/endpoints.dart';
import 'package:feirapp/src/domain/entities/login_entity.dart';

class HttpClientImpl implements HttpClient {
  final LocalStorage localStorage;

  HttpClientImpl({
    required this.localStorage,
  }) {
    final json = localStorage.getString(key: 'credentials');

    String? authorization;

    if (json != null) {
      final LoginEntity credentials = LoginEntity.fromJson(
        jsonDecode(json),
      );
      
      authorization = '${credentials.tokenType} ${credentials.acessToken}';
    }

    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        headers: {
          'authorization': authorization,
        },
      ),
    );
  }

  late final Dio dio;

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
