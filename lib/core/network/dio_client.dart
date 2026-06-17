import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3000',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    return dio;
  }
}
