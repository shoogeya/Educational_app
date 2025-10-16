
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masar/app/sharedWidgets/app_button.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/values/assets/app_icons.dart';

class AttentionDialog extends StatelessWidget {
  const AttentionDialog(
      {super.key,
        required this.description,
        required this.onTap,
        this.okText,
        this.trailing,
        this.isHtml,
        this.title,
        this.cancelText,
        this.icon,
        this.showTittle = true,
        this.iconColor,
        this.onCancel});

  final String description;
  final String? title;
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
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 60.h,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                //toDo: change lockIcon
                icon ?? AppIcons.instance.lockIcon,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: iconColor,
              ),
              if (showTittle == true) ...[
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    title ?? "تحذير",
                    style: AppTextStyles.sb18.copyWith(
                      color: const Color(0xff030406),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              SizedBox(
                height: 12.h,
              ),
              if (isHtml == true)
                Align(
                  alignment: Alignment.center,
                  child: Text(description.toString()),
                ),
              if (isHtml != true)
                Text(
                  description,
                  style: AppTextStyles.r14,
                  textAlign: TextAlign.center,
                ),
              if (trailing != null)
                const SizedBox(
                  height: 8,
                ),
              if (trailing != null) trailing!,
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  if (cancelText != null) ...[
                    Expanded(
                      child: AppButton(
                        borderRadius: 15,
                        fontSize: 14,
                        height: 59,
                        elevation: 0,
                        isLoading: false,
                        title: cancelText ?? "إلغاء",
                        color: AppColors.primary,
                        fontColor: Colors.white, onTap: (){
                        if (onCancel == null) {
                          Get.back();
                        } else {
                          onCancel!();
                        }
                      },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                  Expanded(
                    child: AppButton(
                      borderRadius: 15,
                      fontSize: 14,
                      height: 59,
                      elevation: 0,
                      isLoading: false,
                      title: okText ?? "موافق",
                      onTap: ()async{
                        onTap();
                      },
                      color: AppColors.primary,
                      fontColor: Colors.white,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
