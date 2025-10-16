import 'package:device_info_plus/device_info_plus.dart';
import 'package:masar/app/data/models/data_response.model.dart';
import 'package:masar/app_Imports.dart';
import '../../data/models/country.model.dart';
import '../../layout/main_navigation.controller.dart';
import '../../routes/app_routes.dart';
import '../extentions/app_extention.dart';
import '../values/utils/connection.utils.dart';

class UserManager extends GetxController {
  CountryModel? userCountry;
  CountryModel? userCountryTemp;

  Future<void> logout({
    bool isMakeLogout = true,
    bool showDialog = true,
  }) async {
    LocalStorageProvider.instance.setIsAuth(value: false);
    LocalStorageProvider.instance.setToken(null);
    LocalStorageProvider.instance.setIsIUserSkipOnBoarding(value: true);
    Get.find<MainNavigationController>().reInitPages();
    if (Get.find<MainNavigationController>()
            .scaffoldKey
            .currentState
            ?.isDrawerOpen ==
        true) {
      Get.find<MainNavigationController>()
          .scaffoldKey
          .currentState
          ?.closeDrawer();
      Get.find<MainNavigationController>()
          .scaffoldKey
          .currentState
          ?.closeEndDrawer();
      Get.find<MainNavigationController>().update();
    }
    // LocalStorageProvider.instance.saveUser(null);
    // LocalStorageProvider.instance.saveStudant(null);
    // LocalStorageProvider.instance.saveTeacher(null);
    Get.offNamedUntil(
      AppRoutes.login,
      (route) => false,
      arguments: true,
    );
  }

  Future<void> addFCMToken(String token) async {
    // String fcm = await FirebaseMessaging.instance.getToken() ?? 'No Token';
    if (LocalStorageProvider.instance.token != null) {
      // FcmTokenAction.execute(LocalStorageProvider.instance
      // .fCMToken);
    }
  }

  Future<String?> getUniqueDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (Theme.of(Get.context!).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Updated for new versions
    } else if (Theme.of(Get.context!).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor; // Unique ID for iOS
    }
    return deviceId;
  }

}
