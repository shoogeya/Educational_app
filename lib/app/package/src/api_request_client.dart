import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_request_options.dart';
import 'interceptors/api_log.interceptor.dart';
import 'interceptors/check_server_state.interceptor.dart';
import 'interceptors/network_state.interceptor.dart';
import 'interceptors/token.interceptor.dart';
import 'interceptors/unauthenticated.interceptor.dart';

class RequestClient {
  static RequestClient? _instance;
  final Dio _dio = Dio();

  Dio get dio => _dio;

  RequestClient._() {
    intConfig();
  }

  static RequestClient? get instance {
    _instance ??= RequestClient._();
    return _instance;
  }

  intConfig() {
    _dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: ApiRequestOptions.instance!.baseUrl,
      queryParameters: ApiRequestOptions.instance!.defaultQueryParameters,
      // connectTimeout: ApiRequestOptions.instance!.connectTimeout,
      headers: ApiRequestOptions.instance!.defaultHeaders,
    );
    addInterceptorOnce(NetworkStateInterceptor());
    addInterceptorOnce(CheckServerStateInterceptor());

    if (!kReleaseMode && ApiRequestOptions.instance!.enableLog) {
      addInterceptorOnce(ApiLogInterceptor());
    }

    _dio.options.headers
        .addAll({Headers.acceptHeader: Headers.jsonContentType});

    if (ApiRequestOptions.instance!.unauthenticated != null) {
      addInterceptorOnce(UnauthenticatedInterceptor());
    }
    if (ApiRequestOptions.instance!.interceptors.isNotEmpty) {
      ApiRequestOptions.instance!.interceptors.forEach(addInterceptorOnce);
    }
  }

  configAuth(bool authRequired) {
    bool hasInterceptor = _dio.interceptors.contains(TokenInterceptor());
    if (!authRequired && hasInterceptor) {
      _dio.interceptors.remove(TokenInterceptor());
    } else if (authRequired) {
      addInterceptorOnce(TokenInterceptor());
    }
  }

  addInterceptorOnce(Interceptor interceptor) {
    if (!_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.add(interceptor);
    }
  }

  removeInterceptor(Interceptor interceptor) {
    if (_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.remove(interceptor);
    }
  }
}
