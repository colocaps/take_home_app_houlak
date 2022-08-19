import 'package:core/src/abstractions/dio_manager.dart';
import 'package:dio/dio.dart';

class DioManagerImpl implements DioManager {
  @override
  Future<dynamic> get(
    String url,
  ) async {
    var dio = await _buildDio();
    try {
      var response = await dio.get(url);
      return _buildHttpResponse(response);
    } catch (e) {
      return error(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
  }) async {
    var dio = await _buildDio();
    try {
      var response = await dio.delete(
        path,
        data: data,
        options: Options(
          receiveDataWhenStatusError: true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
      return _buildHttpResponse(response);
    } catch (e) {
      return error(e);
    }
  }

  @override
  Future post(
    String path, {
    data,
  }) async {
    var dio = await _buildDio();
    try {
      var response = await dio.post(
        path,
        data: data,
        options: Options(
          receiveDataWhenStatusError: true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );

      return _buildHttpResponse(response);
    } catch (e) {
      return error(e);
    }
  }

  @override
  Future put(
    String path, {
    data,
  }) async {
    var dio = await _buildDio();
    try {
      var response = await dio.put(
        path,
        data: data,
        options: Options(
          receiveDataWhenStatusError: true,
        ),
      );

      return _buildHttpResponse(response);
    } catch (e) {
      return error(e);
    }
  }
}

Future<Dio> _buildDio() async {
  var dio = Dio();
  return dio;
}

dynamic error(Object e) async {
  if (e is DioError && e.response != null) {
    var error = HttpRequestError(
      e.response!.statusCode,
      e.response!.data,
      e,
    );
    return _buildErrorHttpResponse(error);
  }
  throw e;
}

HttpResponse _buildErrorHttpResponse(HttpRequestError error) {
  return HttpResponse(
    error.data,
    error.statusCode,
  );
}

HttpResponse _buildHttpResponse(Response response) {
  return HttpResponse(
    response.data,
    response.statusCode,
  );
}
