import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:masar/app/core/values/utils/connection.utils.dart';
import 'package:masar/app/core/values/utils/custom_easy_loading.util.dart';
import 'package:masar/app/routes/app_routes.dart';
import 'package:lottie/lottie.dart';
import '../../../app_Imports.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../sharedWidgets/app_button.dart';

class InternetWidget2 extends StatefulWidget {
  const InternetWidget2({super.key});

  @override
  State<InternetWidget2> createState() => _InternetWidget2State();
}

class _InternetWidget2State extends State<InternetWidget2> with ShowSnackBar {
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        CustomEasyLoading.dismiss();
        showSnackBar(
          content: 'يرجى التحقق من اتصالك بالإنترنت',
        );

        // التحقق من حالة تسجيل الدخول
        setState(() {
          _isAuthenticated =
              LocalStorageProvider.instance.isAuthenticate ?? false;
        });
      },
    );
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<void> _handleInternetCheck() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none &&
          await _checkInternetConnection()) {
        // الاتصال متاح
        showSnackBar(
          content: 'تم استعادة اتصال الإنترنت',
        );

        if (Get.previousRoute == AppRoutes.splash) {
        } else {
          if (_isAuthenticated) {
            await Get.offAllNamed(AppRoutes.main);
          } else {
            await Get.offAllNamed(AppRoutes.login);
          }
        }
      } else {
        // الاتصال غير متاح
        showSnackBar(
          content: 'يرجى التحقق من اتصالك بالإنترنت',
        );
      }
    } catch (e) {
      // معالجة الخطأ
      showSnackBar(
        content: 'حدث خطأ أثناء التحقق من الاتصال: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Lottie.asset(
                    'assets/lottie/no_internet.json',
                    height: 200.h,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "لايوجد انترنت".tr,
                    style: AppTextStyles.b20.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'تحقق من اتصالك بالانترنت ثم قم بتحديث الصفحة.',
                    style: AppTextStyles.b15.copyWith(
                      color: Colors.grey.shade400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 100.w,
                      start: 100.w,
                    ),
                    child: AppButton(
                      color: AppColors.primary,
                      isLoading: false,
                      width: 100,
                      elevation: 0,
                      title: 'تحديث'.tr,
                      onTap: _handleInternetCheck,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // زر التنزيلات يظهر فقط إذا كان المستخدم مسجل دخول
                  if (_isAuthenticated)
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: 100.w,
                        start: 100.w,
                      ),
                      child: AppButton(
                        color: AppColors.primary,
                        isLoading: false,
                        width: 100,
                        elevation: 0,
                        title: 'الانتقال إلى التنزيلات'.tr,
                        onTap: () {
                          Get.toNamed(AppRoutes.downloads);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
