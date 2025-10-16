import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/values/assets/app_icons.dart';
import '../../../sharedWidgets/app_button.dart';

class EmptyCoursesWidget extends StatelessWidget {
  const EmptyCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0.r),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.instance.empty_cources),
            40.hp,
            Text(
              "لا يوجد أي كورسات بعد",
              style:
              AppTextStyles.b20.copyWith(color: AppColors.blackTextColor),
            ),
            16.hp,
            Text(
              "أشترك الأن وأحصل على خصم 20%يبدو أنك لم تسجل في أي دورة حتى الآن\n",
              style:
              AppTextStyles.r18.copyWith(color: AppColors.grayTextColor),
              textAlign: TextAlign.center,
            ),
            8.hp,
            AppButton(
              title: "اشترك الآن",
              onTap: () {},
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
