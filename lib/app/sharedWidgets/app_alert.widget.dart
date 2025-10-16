
import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/values/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'app_button.dart';

class AppAlertWidget extends StatelessWidget {
  const AppAlertWidget(
      {super.key,
        required this.description,
        required this.onTap,
        this.okText,
        this.trailing,
        this.titleWidget,
        this.isHtml,
        this.title,
        this.cancelText,
        this.icon,
        this.showTittle = true,
        this.iconColor,
        this.onCancel,this.imageConf});
  final String? imageConf;
  final String description;
  final String? title;
  final Widget? titleWidget;
  final String? okText;
  final String? cancelText;
  final Widget? trailing;
  final bool? isHtml;
  final bool? showTittle;

  final Function onTap;
  final Function? onCancel;
  final String? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        contentPadding: EdgeInsetsDirectional.only(
          start: 15.w,
          end: 15.w,
          bottom: 8.h,
          top: 20.h,
        ),
        actionsPadding: EdgeInsetsDirectional.only(
          top: 10.h,
          bottom: 30.h,
          start: 15.w,
          end: 15.w,
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 30.h,
        ),
        titlePadding: EdgeInsets.symmetric(
          horizontal: 6.w,
        ),
        iconPadding: EdgeInsetsDirectional.only(
          top: 50.h,
        ),
        iconColor: iconColor,
        titleTextStyle: AppTextStyles.sb18.copyWith(
          color: AppColors.blackTextColor,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        icon: icon != null ? SvgPicture.asset(
          icon ?? AppImages.instance.successIcon,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // color: iconColor,
        ): (imageConf != null ?Image.asset(AppImages.instance.congratulation,width: 70,height: 70,) : null),
        title: _buildTitle(),

        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AppButton(
                  borderRadius: 15,
                  fontSize: 14,
                  height: 59,
                  elevation: 0,
                  isLoading: false,
                  title: okText?.tr ?? "ok".tr,
                  onTap: () async {
                    onTap();
                  },
                  color: AppColors.primary,
                  fontColor: Colors.white,
                ),
              ),
              10.wp,
              if (cancelText != null) ...[
                Expanded(
                  child: AppButton(
                    borderRadius: 15,
                    fontSize: 14,
                    height: 59,
                    elevation: 0,
                    isLoading: false,
                    title: cancelText ?? "إلغاء",
                    onTap: () async {
                      if (onCancel == null) {
                        Get.back();
                      } else {
                        onCancel!();
                      }
                    },
                    color: AppColors.secondary,
                    fontColor: Colors.white,
                  ),
                ),

              ],

            ],
          ),

        ],

        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description.tr,
              style: AppTextStyles.r18,
              textAlign: TextAlign.center,
            ),
            if (trailing != null) ...[
              8.hp,
              trailing!,
              8.hp,
            ],
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    if (showTittle == true) {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          top: 16.h,
        ),
        child: SizedBox(
          width: .8.sw,
          child: Align(
            alignment: Alignment.center,
            child: titleWidget ??
                Text(
                  title?.tr ?? "attention".tr,
                  style: AppTextStyles.sb20.copyWith(
                    color: AppColors.blackTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      );
    }
    return null;
  }
}
