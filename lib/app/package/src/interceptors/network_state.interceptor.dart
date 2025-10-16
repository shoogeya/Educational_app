import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../app_Imports.dart';
import '../../../core/values/utils/connection.utils.dart';
import '../../../layout/main_navigation.controller.dart';
import '../../../routes/app_routes.dart';
import 'api.interceptor.dart';
class NetworkStateInterceptor extends ApiInterceptor with ShowSnackBar {
  final String _tag = "network";

  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    actionChecking();

    super.onRequest(options, handler);
  }

  @override
  void onError(
      dio.DioException err, dio.ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    actionChecking();

    super.onError(err, handler);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) async {
    actionChecking();
    super.onResponse(response, handler);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkStateInterceptor &&
          runtimeType == other.runtimeType &&
          _tag == other._tag;

  @override
  int get hashCode => _tag.hashCode;

  void actionChecking() async {
    bool hasLoading = EasyLoading.isShow;

    bool connected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } catch (_) {
      connected = false;
    }

    if (!connected) {
      if (hasLoading) {
        EasyLoading.dismiss();
      }
      //logger.w('NetworkStateInterceptor investAgreement22 ${Get.currentRoute}');
      if (Get.currentRoute == AppRoutes.main &&
          Get.find<MainNavigationController>().index == 0) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showSnackBar(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      } else if (Get.currentRoute == AppRoutes.signUp) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showSnackBar(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      }
      else {
        Get.toNamed(
          AppRoutes.internet,
          arguments: null,
        );
      }
      if (hasLoading) {
        EasyLoading.show();
      }
    }
  }
}
