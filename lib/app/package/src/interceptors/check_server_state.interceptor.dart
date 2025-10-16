
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../main.dart';
import '../../../core/extentions/app_extention.dart';
import '../../../core/managers/user.manager.dart';
import '../../../core/values/utils/connection.utils.dart';
import '../../../core/values/utils/custom_easy_loading.util.dart';
import '../../../layout/main_navigation.controller.dart';
import '../../../routes/app_routes.dart';
import '../api_request_exception.dart';
import 'api.interceptor.dart';

class CheckServerStateInterceptor extends ApiInterceptor with ShowSnackBar {
  final String _tag = "server_state";

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    CustomEasyLoading.dismiss();
    actionFunctionOnError(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    CustomEasyLoading.dismiss();
    actionFunctionOnError(err.response);
    super.onError(err, handler);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    if (Get.currentRoute  == AppRoutes.splash){

    }else{
      CustomEasyLoading.show();
    }
    super.onRequest(options, handler);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CheckServerStateInterceptor &&
              runtimeType == other.runtimeType &&
              _tag == other._tag;

  @override
  int get hashCode => _tag.hashCode;

  Future<void> actionFunctionOnError(Response? response) async {
    int code = response?.statusCode ?? 400;
    EasyLoading.dismiss();
    closeDrawer();
    if (code == 401) {
      //401 but in splash and OnBoarding
      if (getx.Get.currentRoute == AppRoutes.splash ||
          getx.Get.currentRoute == AppRoutes.OnBoarding) {
        return;
      } else {
        //401 but in app pages
        if (getx.Get.currentRoute == AppRoutes.login) {
          return;
        } else if (getx.Get.currentRoute != AppRoutes.internet) {
          logger.w('here issue 401 , ${response?.realUri.path}');
          getx.Get.find<UserManager>().logout(isMakeLogout: false);
        }

      }
    } else if (code >= 400 && code != 401) {
      ApiExceptionType type = errorTypeCustom(code);
      if (type != ApiExceptionType.client) {
        showError(platform_issues);
      } else {
        showError(
          response?.statusMessage.toString(),
        );
      }
      getx.Get.find<MainNavigationController>().reInitPages();
      closeDrawer();
      if (getx.Get.currentRoute != AppRoutes.main) {
        while (getx.Get.isDialogOpen == true &&
            getx.Get.currentRoute != AppRoutes.login) {
          getx.Get.back();
        }
      }
    }
  }
}

