abstract class DioManager {
  Future<dynamic> get(
    String url,
  );

  Future<dynamic> delete(
    String path, {
    dynamic data,
  });
  Future<dynamic> put(
    String path, {
    dynamic data,
  });

  Future<dynamic> post(
    String path, {
    dynamic data,
  });
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse(
    this.data,
    this.statusCode,
  );

  bool isOk() {
    return statusCode == 200 || statusCode == 201;
  }
}

class HttpRequestError implements Exception {
  final int? statusCode;
  final dynamic data;
  final Exception stackTrace;

  const HttpRequestError(
    this.statusCode,
    this.data,
    this.stackTrace,
  );

  @override
  String toString() =>
      'HttpRequestError: statusCode -> $statusCode, data -> $data';
}
