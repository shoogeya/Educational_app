import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/theme/app_colors.dart';
import 'package:masar/app/core/theme/app_text_styles.dart';
import 'package:masar/app/modules/myCourses/model/course.model.dart';
import 'package:masar/app/sharedWidgets/custom_card.dart';
import '../../../../app_Imports.dart';

class AboutCourseHeader extends StatelessWidget {
  const AboutCourseHeader({super.key, this.course});

  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: course?.courseImage ?? "",
                height: 120.h,
                fit: BoxFit.contain,
                // Adjust as per your requirement
                // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            8.wp,
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course?.courseName ?? "",
                    style: AppTextStyles.b22.copyWith(color: AppColors.primary),
                  ),
                  4.hp,
                  Row(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: course?.teacherImage ?? "",
                          // URL of the image
                          fit: BoxFit.cover,
                          // Adjust as per your requirement
                          width: 40.0,
                          // Width of the circular image
                          height: 40.0,
                          // Height of the circular image
                          // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      8.wp,
                      Column(
                        children: [
                          Text(
                            course?.teacherFullName ?? "",
                            style: AppTextStyles.r20
                                .copyWith(color: AppColors.grayTextColor),
                          ),
                          Text(
                            "${course?.subjectTitle ?? ""}",
                            style: AppTextStyles.r15
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
