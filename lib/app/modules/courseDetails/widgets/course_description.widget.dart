import 'package:auto_size_text/auto_size_text.dart';
import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/modules/myCourses/model/course.model.dart';
import 'package:masar/app/sharedWidgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CourseDescriptionWidget extends StatelessWidget {
  const CourseDescriptionWidget({super.key,this.course});
  final CourseModel? course;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "وصف المساق",
          style: AppTextStyles.b20.copyWith(color: AppColors.primary),
        ),
        8.hp,
        CustomCard(
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: AutoSizeText(
              course?.courseDescription ?? "",
              style: AppTextStyles.r18.copyWith(color: AppColors.grayTextColor),
            ),
          ),
        )
      ],
    );
  }
}
