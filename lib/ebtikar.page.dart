import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'app/core/theme/app_themes.dart';
import 'app/core/values/utils/global_variable.dart';
import 'app/data/providers/local_storage_provider.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/bindings/app_binding.dart';
import 'app/sharedWidgets/remove_scroll_glow.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EbtikarApp extends StatefulWidget {
  const EbtikarApp({Key? key}) : super(key: key);

  @override
  State<EbtikarApp> createState() => _EbtikarAppState();
}

class _EbtikarAppState extends State<EbtikarApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    //this for setup the UI
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (c, _) {
        return KeyboardDismisser(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: GlobalVariable.instance.white,
            child: GetMaterialApp(
              scrollBehavior: const RemoveScrollGlow(),
              smartManagement: SmartManagement.full,
              debugShowCheckedModeBanner: false,
              title: 'ebtikar',
              getPages: AppPages.pages,
              defaultTransition: Transition.cupertino,
              locale: Locale(LocalStorageProvider.instance.locale),
              fallbackLocale: const Locale("ar"),
              supportedLocales: const [
                Locale("ar")
              ],
              localizationsDelegates:   [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: AppThemes.light,
              // darkTheme: AppThemes.dark,
              themeMode: AppThemes.themeMode,
              initialRoute: AppRoutes.splash,
              initialBinding: AppBinding(),

              builder: (context, widget) {
                ScreenUtil.registerToBuild(
                  context,
                );
                return ScrollConfiguration(
                  behavior: const RemoveScrollGlow(),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1,
                    ),
                    child: widget!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
