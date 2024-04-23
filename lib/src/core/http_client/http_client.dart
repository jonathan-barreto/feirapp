abstract class HttpClient {
  Future<HttpResponse> get({required String endpoint});

  Future<HttpResponse> post({
    required String endpoint,
    required dynamic body,
  });
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({
    required this.data,
    required this.statusCode,
  });
}
