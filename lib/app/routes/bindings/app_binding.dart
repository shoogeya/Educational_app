import 'package:masar/app/core/managers/app.manager.dart';
import 'package:masar/app/core/managers/user.manager.dart';
import 'package:masar/app/modules/favorite/favorite.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../config/config.dart';
import '../../core/managers/image_model.manager.dart';
import '../../core/managers/loading_controller.dart';
import '../../core/service/image_picker_service.dart';
import '../../data/providers/local_storage_provider.dart';
import '../../layout/main_navigation.controller.dart';
import '../../modules/courseDetails/course_details.controller.dart';
import '../../modules/myCourses/my_cources.controller.dart';
import '../../package/src/api_request_options.dart';
import '../../services/network/network.controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainNavigationController(),
      permanent: true,
    );
    Get.put(
      AppManager(),
      permanent: true,
    );
    Get.put(
      LoadingController(),
      permanent: true,
    );
    Get.put(
      UserManager(),
      permanent: true,
    );
    Get.put(ImagePickerService());
    Get.lazyPut(
      () => ImageModel(),
      fenix: true,
    );
    Get.lazyPut(
      () => MyCoursesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => FavoriteController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CourseDetailsController(),
      fenix: true,
    );
    Get.put(
      NetworkController(),
      permanent: true,
    );
  }

  static Future<void> onRunApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        // DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    ApiRequestOptions.instance?.config(
      baseUrl: Config.baseUrl,
      getToken: () => LocalStorageProvider.instance.token,
      tokenType: 'Bearer ',
      // enableLog: false,
      enableLog: kDebugMode,
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        // DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    await AppBinding.initAsyncDependencies();
  }

  static initAsyncDependencies() async {
    await GetStorage.init();
  }
}
