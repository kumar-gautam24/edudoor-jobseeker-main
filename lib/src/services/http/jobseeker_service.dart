import 'package:dio/dio.dart';
import 'package:edudoor_jobseeker/src/configurations/authentication_interceptor.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';

class JobseekerService {
  JobseekerService._();

  static const String _baseUrl = 'http://20.197.55.201:3000/jobseeker-service/api/v1/jobseeker/';
  // static const String _baseUrl = 'http://192.168.101.193:3001/api/v1/jobseeker/';
  static Dio? _dio;
  static Dio? _instance() {
    if (_dio != null) return _dio;
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    _dio?.interceptors.add(AuthenticationInterceptor());
    return _dio;
  }

  static Future<Response> get(String route, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _instance()!.get(route, queryParameters: queryParameters, options: Options());
    } catch (error) {
      rethrow;
    }
  }

  static Future<Response> post(String route, {Object? data}) async {
    try {
      return await _instance()!.post(route, data: data, options: Options());
    } catch (error) {
      rethrow;
    }
  }

  static Future<Response> put(String route, {Object? data}) async {
    try {
      Log.fatal(tag: "UPDATE", message: data.toString());
      return await _instance()!.put(route, data: data, options: Options());
    } catch (error) {
      rethrow;
    }
  }

  static Future<Response> refreshToken(String route, {Map<String, Object>? data, Options? options}) async {
    Dio refreshDio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    try {
      return await refreshDio.post(route, data: data, options: options);
    } catch (error) {
      rethrow;
    }
  }
}
