// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../assets/app_images.dart';

border(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      5.r,
    ),
    borderSide: BorderSide(
      color: color,
      width: 0.4,
    ),
  );
}

normalBorder(Color color) {
  return UnderlineInputBorder(
    borderRadius: BorderRadius.circular(
      5.r,
    ),
    borderSide: BorderSide(color: color, width: 0.4),
  );
}

InputDecoration subscripeDecoration = InputDecoration(
  focusedErrorBorder: generalBorder,
  focusedBorder: generalBorder.copyWith(
      borderRadius: BorderRadius.circular(
        5.r,
      ),
      borderSide: BorderSide(color: AppColors.primary, width: 0.4)),
  border: normalBorder(AppColors.primary),
  isDense: false,
  labelStyle: AppTextStyles.r13.copyWith(color: Colors.black),
  errorBorder: generalBorder,
  enabledBorder: normalBorder(
    AppColors.primary,
  ),
  floatingLabelStyle: AppTextStyles.b13.copyWith(color: Colors.black),
  disabledBorder: generalBorder,
  labelText: 'your_email_address'.tr,
);

OutlineInputBorder generalBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    5.r,
  ),
  borderSide: BorderSide(color: Colors.black, width: 0.4),
);

InputDecoration inputDecoration({
  String? label,
  String? hint,
  Widget? suffex,
  Widget? prefixWidget,
  Widget? suffexWidget,
  Color? color,
  Color? borderColorError,
  Color? errorTextColor,
  OutlineInputBorder? border,
  String? prefix,
  String? counterText,
  bool enabled = true,
  FloatingLabelBehavior floatingLabel = FloatingLabelBehavior.auto,
  TextStyle? labelStyle,
  // Widget? labelWidget,
  EdgeInsetsGeometry? contentPadding,
}) {
  bool isSvg = prefix?.contains("svgs") ?? false;
  if (!isSvg) {
    isSvg = prefix?.contains("svg") ?? false;
  }

  return InputDecoration(
    counterText: counterText ?? "",
    alignLabelWithHint: true,
    floatingLabelBehavior: floatingLabel,
    hintText: hint ?? label,
    floatingLabelAlignment: FloatingLabelAlignment.start,

    // label: labelWidget,
    //     Text(
    //       label ?? "",
    //       style: labelStyle ??
    //           AppTextStyles.r13.copyWith(color: AppColors.black5b),
    //     ),
    labelStyle:
    labelStyle ?? AppTextStyles.r13.copyWith(color: Colors.black),
    floatingLabelStyle: AppTextStyles.b13.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: labelStyle ??
        AppTextStyles.r13.copyWith(
          color: Colors.black,
          height: 1.8,
          textBaseline: TextBaseline.alphabetic,
        ),
    isDense: false,
    contentPadding:
    contentPadding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    fillColor: color ?? Colors.white,
    filled: true,
    prefixStyle: AppTextStyles.r14,

    suffixIcon: suffex != null
        ? SizedBox(
      height: 18,
      width: 18,
      child: Center(child: suffex),
    )
        : suffexWidget,
    prefixIcon: prefix != null
        ? SizedBox(
      height: 18,
      width: 18,
      child: Center(
        child: isSvg
            ? SvgPicture.asset(
          prefix,
          width: 17,
          fit: BoxFit.contain,
          height: 17,
          color: Colors.black,
        )
            : Image.asset(
          prefix,
          width: 17,
          fit: BoxFit.contain,
          height: 17,
        ),
      ),
    )
        : prefixWidget,
    border: generalBorder,
    focusedErrorBorder: generalBorder.copyWith(
      borderRadius: BorderRadius.circular(
        5.r,
      ),
      borderSide: BorderSide(
        color: borderColorError ?? Colors.red,
        width: 0.4,
      ),
    ),
    // errorMaxLines: 3,
    focusedBorder: generalBorder.copyWith(
      borderRadius: BorderRadius.circular(
        5.r,
      ),
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 0.4,
      ),
    ),
    errorBorder: generalBorder.copyWith(
      borderRadius: BorderRadius.circular(
        5.r,
      ),
      borderSide: BorderSide(
        color: borderColorError ?? Colors.red,
        width: 0.9,
      ),
    ),

    errorStyle: AppTextStyles.r13.copyWith(
      color: errorTextColor ?? Colors.red,
      fontWeight: FontWeight.w500,
    ),
    enabledBorder: generalBorder,
    disabledBorder: generalBorder,
  );
}

InputDecoration searchInputDecoration({
  String? hint,
  Widget? suffex,
  Color? color,
  bool enabled = true,
}) {
  OutlineInputBorder generalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      5.r,
    ),
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.8),
  );
  return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.r13.copyWith(color: const Color(0xff55595D)),
      isDense: false,

      // Added this
      fillColor: color ?? Colors.white,
      filled: true,
      suffixIcon: suffex != null
          ? SizedBox(
        height: 18,
        width: 18,
        child: Center(child: suffex),
      )
          : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      prefixIcon: SizedBox(
        height: 18,
        width: 18,
        child: Center(
          child: Icon(Icons.search),
        ),
      ),
      border: generalBorder,
      focusedErrorBorder: generalBorder,
      focusedBorder: generalBorder,
      enabledBorder: generalBorder,
      disabledBorder: generalBorder);
}
