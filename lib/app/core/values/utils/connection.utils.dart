import 'package:flutter/material.dart';
import '../../../layout/main_navigation.controller.dart';
import '../../../routes/app_routes.dart';
import '../../../sharedWidgets/attention_dialog.widget.dart';
import '../../managers/user.manager.dart';
import '../../theme/app_text_styles.dart';
import 'package:get/get.dart';
import 'dart:io';
mixin ShowSnackBar {
  void showSnackBar({
    required String content,
    Color color = Colors.black,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        padding: const EdgeInsetsDirectional.all(17),
        content: Text(
          content,
          style: AppTextStyles.b14.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
  static void showSnackBarStatic({
    required String content,
    Color color = Colors.black,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        padding: const EdgeInsetsDirectional.all(17),
        content: Text(
          content,
          style: AppTextStyles.b14.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}




class ConnectionUtils {
  static Future connect() async {
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
      if (Get.currentRoute == AppRoutes.main &&
          Get.find<MainNavigationController>().index == 0) {
        WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
            ShowSnackBar.showSnackBarStatic(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      } else if (Get.currentRoute == AppRoutes.signUp) {
        WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
            ShowSnackBar.showSnackBarStatic(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      } else {
        Get.toNamed(AppRoutes.internet);
      }
    }
    return connected;
  }

  static Future<void> connect2() async {
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
      if (Get.currentRoute == AppRoutes.main &&
          Get.find<MainNavigationController>().index == 0) {
        WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
            ShowSnackBar.showSnackBarStatic(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      } else if (Get.currentRoute == AppRoutes.signUp) {
        WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
            ShowSnackBar.showSnackBarStatic(
              content: 'يرجى التحقق من اتصالك بالإنترنت',
            );
          },
        );
      }


      else if (Get.currentRoute == AppRoutes.splash) {
        Get.toNamed(
          AppRoutes.internet,
          arguments: {
            'onTap': () async {
              Get.back();
            },
          },
        );
      } else {
        Get.toNamed(AppRoutes.internet);
      }
    }
  }

  static forceConnection() async {
    bool connected = false;

    if (!connected) {
      await Get.dialog(
          WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AttentionDialog(
              description: "not_connected_yet".tr,
              onTap: () async {
                try {
                  final result = await InternetAddress.lookup('google.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    Get.back();
                  }
                } catch (_) {
                  connected = false;
                }
              },
            ),
          ),
          barrierDismissible: false);
    }
  }
}



