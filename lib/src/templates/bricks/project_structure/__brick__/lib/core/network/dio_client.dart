import 'package:dio/dio.dart';

/// Configured Dio HTTP client.
class DioClient {
  DioClient._();

  static Dio? _instance;

  static Dio get instance {
    _instance ??= Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ]);

    return _instance!;
  }
}
