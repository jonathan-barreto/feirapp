import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feirapp/src/core/http_client/http_client.dart';
import 'package:feirapp/src/core/local_storage/local_storage.dart';
import 'package:feirapp/src/core/shared/constants/app_endpoints.dart';
import 'package:feirapp/src/core/shared/constants/app_storage_keys.dart';
import 'package:feirapp/src/data/model/credential_model.dart';

class HttpClientImpl implements HttpClient {
  final LocalStorage localStorage;

  HttpClientImpl({
    required this.localStorage,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseApi,
        headers: {},
      ),
    );

    initialize();
  }

  late final Dio dio;

  void initialize() async {
    final String json = await localStorage.getString(
      key: AppStorageKeys.credential,
    );

    if (json.isNotEmpty) {
      final CredentialModel credentials = CredentialModel.fromMap(
        jsonDecode(json),
      );

      final authorization =
          '${credentials.tokenType} ${credentials.accessToken}';

      dio.options.headers['authorization'] = authorization;
    }
  }

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
