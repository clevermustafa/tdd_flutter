import 'package:dio/dio.dart';
import 'package:testing_with_flutter/core/app_url.dart';
import 'package:testing_with_flutter/core/exceptions.dart';

class NetworkUtils {
  late Dio _dio;

  NetworkUtils({required Dio dio}) {
    _dio = dio;
    BaseOptions options = BaseOptions();
    options.baseUrl = AppUrl.baseUrl;
    _dio.options = options;
  }

  ///used for calling Get Request
  Future<Response> get(String url, {Map<String, String>? query}) async {
    Response response = await _dio.get(url,
        queryParameters: query,
        options: Options(responseType: ResponseType.json));

    return response;
  }
}

parseResponse(Response response) {
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw ServerException(response.statusMessage!);
  }
}
