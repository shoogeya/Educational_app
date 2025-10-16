import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalVariable {
  GlobalVariable._();

  static GlobalVariable instance = GlobalVariable._();

  var white = SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
  );
  var transparent = SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
  );

}