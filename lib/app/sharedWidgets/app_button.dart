
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/values/utils/gloabl_functions.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double height;
  final double? width;
  final double elevation;
  final double? borderRadius;
  final double fontSize;
  final Color? color;
  final BorderSide? borderSide;
  final Color fontColor;
  final Function onTap;
  final bool isLoading;
  final FontWeight fontWeight;
  final bool? isDisabled;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    Key? key,
    this.color,
    this.padding,
    this.fontColor = Colors.white,
    this.borderSide,
    this.height = 50,
    this.elevation = 1.5,
    this.fontWeight = FontWeight.bold,
    this.width,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.isLoading = false,
    required this.title,
    required this.onTap,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled ?? false,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          width: width?.toDouble().w ?? 1.sw,
          height: height.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor: isDisabled == true
                  ? AppColors.disabledColor
                  : color ??
                  (isDisabled == true
                      ? AppColors.disabledColor
                      : AppColors.primary),

              padding: padding ?? EdgeInsets.zero,
              elevation: elevation,
              backgroundColor: backGroundColor,
              shape: RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
                borderRadius: BorderRadius.circular(
                  borderRadius?.r ?? 12.r,
                ),
              ),
              minimumSize: Size(
                width?.toDouble().w ?? 1.sw,
                height.h,
              ),
              // width: width?.toDouble() ?? 1.sw,
              alignment: Alignment.center,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            onPressed: isDisabled == true
                ? () {}
                : () {
              GlobalFunctions.instance.hiddenKeyboard();

              onTap();
            },
            child: Center(
              child: Text(
                title.tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.b16.copyWith(
                  color: textButtonColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
                // style: AppTextStyles.r16.copyWith(
                //   color: Colors.white,
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get buttonDisabled {
    return color == AppColors.disabledColor || isDisabled == true;
  }

  Color get textButtonColor {
    return fontColor;
  }

  Color get backGroundColor {
    if (buttonDisabled) {
      return AppColors.disabledColor;
    } else {
      return color ?? AppColors.primary;
    }
  }
}
