import 'package:dio/dio.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/resources/jobseeker_repo.dart';
import 'package:edudoor_jobseeker/src/secure_storage/local_storage_keys.dart';
import 'package:edudoor_jobseeker/src/secure_storage/secure_storage.dart';
import 'package:edudoor_jobseeker/src/services/web_socket/socket.dart';

class AuthenticationInterceptor extends InterceptorsWrapper {
  static const String _contentType = "application/json";
  static String? _accessToken;

  Dio dio = Dio();

  AuthenticationInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _accessToken ??= await SecureStorage.read(key: LocalStorageKeys.ACCESS_TOKEN);
    options.headers['Authorization'] = 'Bearer $_accessToken';
    options.contentType = _contentType;
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    Log.info(tag: "RESPONSE_SUCCESS", message: response.data);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      Log.error(tag: "RESPONSE_ERROR ${err.requestOptions.path}", message: err.message);
      if (err.response?.statusCode == 401 && err.requestOptions.extra['isRetry'] == null) {
        final String refreshToken = await SecureStorage.read(key: LocalStorageKeys.REFRESH_TOKEN) ?? "";

        Options options = Options();
        options.extra = {"isRetry": true};
        final response = await JobseekerRepo().refreshToken(refreshToken: refreshToken, options: options);

        await SecureStorage.write(key: LocalStorageKeys.ACCESS_TOKEN, value: response['accessToken']);
        await SecureStorage.write(key: LocalStorageKeys.REFRESH_TOKEN, value: response['refreshToken']);
        await SecureStorage.write(key: LocalStorageKeys.REFRESH_TOKEN_EXPIRE, value: response['refreshTokenExpiresIn']);
        _accessToken = response['accessToken'];
        SocketService.connectAndListen();
        try {
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          Log.error(tag: "RETRY_ERROR", message: "Error while retrying request: ${e.toString()}");
          rethrow;
        }
      }

      handler.next(err);
    } catch (er) {
      AllBloc.authenticationBloc.add(AuthenticationClearEvent());
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final Options options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      extra: requestOptions.extra,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      followRedirects: requestOptions.followRedirects,
      maxRedirects: requestOptions.maxRedirects,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
    );
    options.headers?['Authorization'] = 'Bearer $_accessToken';
    options.contentType = _contentType;

    return await dio.request(
      requestOptions.baseUrl + requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
