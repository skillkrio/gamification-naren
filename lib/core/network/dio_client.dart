import 'package:dio/dio.dart';
import 'package:roughdraft/core/constants/api_constants.dart';
//Singleton pattern
class DioClient {
  DioClient._internal();
  static final DioClient _client = DioClient._internal();
  static late Dio _dio;
  factory DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {"Content-Type": "application/json"},
      ),
    );
    return _client;
  }
  Dio get dio => _dio;
}
