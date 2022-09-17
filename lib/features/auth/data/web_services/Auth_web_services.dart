import 'package:dio/dio.dart';
import 'package:social_app/constants/strings.dart';

class AuthWebServices {
  static late Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

    static Future<Response> postAuthData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      
    };
    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
