import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://corona.lmao.ninja/v2/countries/',
      receiveDataWhenStatusError: true,
    ));
  }


  static Future<Response> getData({
    Map<String, dynamic>? query,
    required String url,
  }) async {
    return await dio!.get(url, queryParameters: {'now':true,'strict':true});
  }
}
