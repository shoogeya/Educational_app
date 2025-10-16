import 'package:dio/dio.dart' as dio;
import 'package:masar/app/core/extentions/app_extention.dart';
import 'package:get/get.dart';

enum ApiExceptionType { client, server, custom }

class ApiRequestException {
  int statusCode;
  String statusMessage;
  ApiExceptionType? type;
  dynamic errors;
  dio.Response<dynamic>? response;
  dynamic error;

  ApiRequestException({
    required this.statusCode,
    this.statusMessage = "",
    this.errors,
    this.response,
    this.error,
  });

  String get errorMessage {
    if (statusCode == 401) {
      statusMessage = 'انتهت صلاحية الجلسة الخاصة بك';
    }
    if (statusCode >= 400 && statusCode < 500) {
      statusMessage = platform_issues;
    }

    if (statusCode >= 500) {
      // return "server_error $statusCode $statusMessage";
      statusMessage = 'قد يكون النظام الأساسي قيد الصيانة، يرجى المحاولة مرة أخرى لاحقًا.';
    }
    return statusMessage;
  }

  ApiExceptionType get errorType {
    if (statusCode >= 400 && statusCode < 500) {
      type = ApiExceptionType.client;
      return ApiExceptionType.client;
    }
    if (statusCode >= 500) {
      type = ApiExceptionType.server;

      return ApiExceptionType.server;
    }
    type = ApiExceptionType.custom;

    return ApiExceptionType.custom;
  }
}

ApiExceptionType errorTypeCustom(statusCode) {
  if (statusCode >= 400 && statusCode < 500) {
    return ApiExceptionType.client;
  }
  if (statusCode >= 500) {
    return ApiExceptionType.server;
  }

  return ApiExceptionType.custom;
}
