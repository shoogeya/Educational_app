import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/values/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../sharedWidgets/custom_card.dart';

class CourseItemWidget extends StatelessWidget {
   const CourseItemWidget({super.key,this.showProgress});
   final bool? showProgress;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(11.r),
        ),
      ),
      border: Border.all(color: AppColors.colorC3C5CC, width: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11.r),
                      topRight: Radius.circular(11.r)),
                  image: DecorationImage(
                      image: AssetImage(AppImages.instance.personexample2),
                      fit: BoxFit.cover)),
            ),
          ),
          // 12.hp,
          Padding(
            padding: EdgeInsets.only( bottom: 8.h,right: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("الفيزياء",
                        style: AppTextStyles.b16
                            .copyWith(color: AppColors.color012447)),
                    IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: AppColors.colorF4F4FF,
                          child: Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ))
                  ],
                ),
                Visibility(
                  visible: showProgress ?? true,
                  child: Row(
                    children: [
                      Text("93/125",
                          style: AppTextStyles.r13
                              .copyWith(color: AppColors.grayTextColor)),
                      8.wp,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 8.w),
                          // width: MediaQuery.of(context).size.width, // Width of the line
                          height: 6.h, // Height of the line
                          decoration: BoxDecoration(
                            color: AppColors.colorF5F9FF, // Color of the line
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: AppColors.colorE8F1FF,width: 5)// Rounded corners
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.3, // Adjust the width based on value (percentage)
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.color167F71, // Co// Rounded corners
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
