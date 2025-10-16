import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'app_themes.dart';

class AppTextStyles {
  static PinTheme defaultPinTheme = PinTheme(
      width: 44.w,
      height: 48.h,
      textStyle: const TextStyle(fontSize: 17, color: Colors.black),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffB2B6B7), width: .5),
      ));

  static TextStyle get b34 => TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w800,
    height: 1.3,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b32 => TextStyle(
    fontSize: 32,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b30 => TextStyle(
    fontSize: 30,
    height: 1.3,
    fontWeight: FontWeight.bold,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b19 => TextStyle(
    fontSize: 19,
    height: 1.3,
    fontWeight: FontWeight.bold,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r17monst => TextStyle(
    fontSize: 17,
    height: 1.3,
    fontWeight: FontWeight.w500,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b24 => TextStyle(
    fontSize: 24,
    height: 1.3,
    fontWeight: FontWeight.w700,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b18 => TextStyle(
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b20 => TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b22 => TextStyle(
    fontSize: 22,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r22 => TextStyle(
    fontSize: 22,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b10 => TextStyle(
    fontSize: 10,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb18 => TextStyle(
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb23 => TextStyle(
    fontSize: 23,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get bInter16 => TextStyle(
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r33 => TextStyle(
    fontSize: 33,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb24 => TextStyle(
    fontSize: 24,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r26 => TextStyle(
    fontSize: 24,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb20 => TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r20 => TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r18 => TextStyle(
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb16 => TextStyle(
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r16 => TextStyle(
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r15 => TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b14 => TextStyle(
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b15 => TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get bB15 => TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w900,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b16 => TextStyle(
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r14 => TextStyle(
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r13 => TextStyle(
    decoration: TextDecoration.none,
    fontSize: 13,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r12 => TextStyle(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get rInter14 => TextStyle(
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get rInter16 => TextStyle(
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb12 => TextStyle(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb13 => TextStyle(
    fontSize: 13,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b12 => TextStyle(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w800,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get b13 => TextStyle(
    decoration: TextDecoration.none,
    fontSize: 13,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb10 => TextStyle(
    fontSize: 10,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb14 => TextStyle(
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get sb15 => TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get r10 => TextStyle(
    fontSize: 10,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );

  static TextStyle get l12 => TextStyle(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.normal,
    fontFamily: AppThemes.getFontFamily(),
  );
}
