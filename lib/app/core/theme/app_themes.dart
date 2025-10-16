import 'package:masar/app/core/values/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/providers/local_storage_provider.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.primary,
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withOpacity(0.6),
    ),
    highlightColor: AppColors.secondary,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      secondary: AppColors.secondary,
      primary: AppColors.primary,
    ),
    useMaterial3: false,
    fontFamily: getFontFamily(),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade50,
      elevation: 3.2,
      scrimColor: Colors.transparent,
    ),
    dialogBackgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
// backgroundColor: ,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      modalBackgroundColor: Colors.white,
      dragHandleColor: Colors.white,
      modalBarrierColor: Colors.white,
      shadowColor: Colors.grey.shade50,
      surfaceTintColor: Colors.white,
      modalElevation: 6.2,
      elevation: 6.2,
    ),

    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      systemOverlayStyle: GlobalVariable.instance.white,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      foregroundColor: Colors.white,
      // color: Colors.white,
    ),
  );

  static ThemeMode get themeMode => ThemeMode.light;

  static bool isRtl() {
    if (LocalStorageProvider.instance.locale == "ar") {
      return true;
    }
    return false;
  }

  static String getFontFamily({String? en}) {
    return GoogleFonts.tajawal().fontFamily ?? "";
  }

  static String getBoldFontFamily({String? en}) {
    return GoogleFonts.tajawal(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ).fontFamily ??
        "";
  }

  static String getRegularFontFamily({String? en}) {
    return GoogleFonts.tajawal(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ).fontFamily ??
        "";
  }
}
