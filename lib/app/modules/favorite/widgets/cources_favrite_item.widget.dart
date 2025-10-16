import 'package:auto_size_text/auto_size_text.dart';
import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/values/utils/enum.dart';
import 'package:masar/app/modules/myCourses/model/course.model.dart';
import '../../../../app_Imports.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../sharedWidgets/custom_card.dart';
import '../favorite.controller.dart';

class CoursesFavoriteItemWidget extends GetView<FavoriteController> {
  const CoursesFavoriteItemWidget(
      {super.key, required this.courseType, this.course, this.isFromFaVPage});

  final CourseEnum courseType;
  final CourseModel? course;
  final bool? isFromFaVPage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (controller) {
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11.r),
                    topRight: Radius.circular(11.r)),
              ),
              child: CachedNetworkImage(
                imageUrl: course?.courseImage ?? "",
                fit: BoxFit.cover,
                // Adjust as per your requirement
                // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // 12.hp,
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, right: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          course?.courseName ?? "",
                          style: AppTextStyles.b15
                              .copyWith(color: AppColors.color012447),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                12.wp,
                                Column(
                                  children: [
                                    Text(
                                      course?.teacherFullName ?? "",
                                      style: AppTextStyles.b15.copyWith(
                                          color: AppColors.blackTextColor),
                                    ),
                                    Text(
                                      "${course?.subjectTitle}",
                                      style: AppTextStyles.r15.copyWith(
                                          color: AppColors.grayTextColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${course?.teacherAverageRate}",
                                  style: AppTextStyles.b15
                                      .copyWith(color: AppColors.color012447),
                                  textAlign: TextAlign.center,
                                ),
                                6.wp,
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  // رفع الأيقونة قليلاً
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 24, // قلل الحجم قليلاً لتناسب النص
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        16.hp,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (course?.courseEnumType == CourseEnum.paidCourse)
                              _infoItem(
                                "${course?.enrolledStudentNumber ?? 0} طالب",
                                showDivider: true,
                              ),
                            _infoItem(
                              "${course?.videosNumber ?? 0} درس",
                              showDivider: true,
                            ),
                            _infoItem(
                              "${course?.totalTimeInHours ?? 0} ساعة",
                              showDivider: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _infoItem(String text, {bool showDivider = true}) {
    return Row(
      children: [
        Text(
          text,
          style: AppTextStyles.b16.copyWith(color: AppColors.primary),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 16,
              width: 1.5,
              color: AppColors.primary.withOpacity(0.6),
            ),
          ),
      ],
    );
  }
}
