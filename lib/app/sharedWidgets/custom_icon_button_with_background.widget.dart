import 'package:masar/app/core/theme/app_colors.dart';
import 'package:masar/app/core/values/assets/app_icons.dart';
import 'package:masar/app/sharedWidgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithBackgroundWidget extends StatelessWidget {
  const IconButtonWithBackgroundWidget(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final String icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 40.h,
      child: Stack(
        children: [
          CustomCard(
            margin: EdgeInsets.only(left: 5.w, top: 3.h),
            elevation: 0,
            borderRadius: 8,
            color: AppColors.whiteColor,
            child: Center(
                child: IconButton(
              icon: SvgPicture.asset(
                icon,
                width: 18.w,
                height: 18.h,
              ),
              onPressed: onPressed,
            )),
          ),
          Visibility(
          visible: icon == AppIcons.instance.message,
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                AppIcons.instance.dotmessage,
                width: 10.w,
                height: 10.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
