import 'package:dio/dio.dart';
import 'package:social_app/constants/strings.dart';

class PostsWebServices {
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

  static Future<Response> getPosts({
    required String url,
    required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ,
    };
    return dio.get(
      url,
    );
  }

  static Future<Response> createPost({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
