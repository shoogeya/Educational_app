import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/theme/app_colors.dart';
import 'package:masar/app/core/theme/app_text_styles.dart';
import 'package:masar/app/core/values/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.instance.nodata,width: 200,height: 100,),
        16.hp,
        Text("لا يوجد بيانات",style: AppTextStyles.b15.copyWith(color: AppColors.blackTextColor),)
      ],
    );
  }
}
