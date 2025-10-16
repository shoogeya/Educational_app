import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/theme/app_text_styles.dart';
import 'package:masar/app/core/values/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset(AppIcons.instance.emptyFavourite,width: 150.w,height: 150.h,),
        32.hp,
        Text("لا يوجد عناصر داخل المفضلة",style: AppTextStyles.sb16,),
        8.hp,
        IconButton(onPressed: (){
        }, icon: SvgPicture.asset(AppIcons.instance.addIcon))
      ],),
    );
  }
}
