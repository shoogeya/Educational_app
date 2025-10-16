import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/modules/myCourses/model/course.model.dart';
import 'package:masar/app/sharedWidgets/custom_card.dart';
import 'package:masar/app_Imports.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/values/assets/app_images.dart';
import '../../../core/values/utils/enum.dart';

class CourseDetailsWidget extends StatelessWidget {
  const CourseDetailsWidget({super.key,this.course});
  final CourseModel? course;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تفاصيل المساق",
          style: AppTextStyles.b20.copyWith(color: AppColors.primary),
        ),
        8.hp,
        CustomCard(
          child:  Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: Column(children: [
              Row(children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: course?.teacherImage ?? "", // URL of the image
                    fit: BoxFit.cover, // Adjust as per your requirement
                    width: 40.0, // Width of the circular image
                    height: 40.0, // Height of the circular image
                    // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                        width: 128.w,
                        height: 128.h,
                        AppImages.instance.person_avatar),
                  ),
                ),
                8.wp,
                Column(children: [
                  Text(
                    course?.teacherFullName ?? "",
                    style: AppTextStyles.r20.copyWith(color: AppColors.grayTextColor),
                  ),
                  Text(
                    "${course?.subjectTitle ?? ""}",
                    style: AppTextStyles.r15.copyWith(color: AppColors.primary),
                  ),
                ],)

              ],),
              16.hp,
              Row(
                children: [
                  Text("مدة الكورس : ",style: AppTextStyles.b18.copyWith(color: AppColors.blackTextColor),),
                  Text("${course?.totalTimeInHours} ساعة ",style: AppTextStyles.r20.copyWith(color: AppColors.grayTextColor),
                  ),
                ],
              ),
              8.hp,
              Visibility(
                visible: course?.courseEnumType == CourseEnum.paidCourse,
                child: Row(
                  children: [
                    Text("عدد الاشتراكات : ",style: AppTextStyles.b18.copyWith(color: AppColors.blackTextColor),
                    ),
                    Text(" ${course?.enrolledStudentNumber ?? 0} اشتراك ",style: AppTextStyles.r20.copyWith(color: AppColors.grayTextColor),
                    ),
                  ],
                ),
              ),
              8.hp,
              Row(
                children: [
                  Text(" التقييم : ",style: AppTextStyles.b18.copyWith(color: AppColors.blackTextColor),
                  ),
                  _buildRatingStars(
                      course?.teacherAverageRate?.toDouble() ?? 0.0),
                  // Text("${course?.teacherAverageRate}",style: AppTextStyles.r20.copyWith(color: AppColors.grayTextColor),
                  // ),
                ],
              ),
              8.hp,
            ],),
          ),
        )
      ],
    );
  }
  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    int halfStar = (rating - fullStars) >= 0.5 ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStar;

    return Row(
      children: List.generate(
        5,
            (index) {
          if (index < fullStars) {
            return Icon(Icons.star, color: Colors.yellow, size: 20.sp);
          } else if (index < fullStars + halfStar) {
            return Icon(Icons.star_half, color: Colors.yellow, size: 20.sp);
          } else {
            return Icon(Icons.star_border, color: Colors.yellow, size: 20.sp);
          }
        },
      ),
    );
  }
}
