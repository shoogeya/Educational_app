import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/modules/courseDetails/widgets/course_description.widget.dart';
import 'package:masar/app/modules/courseDetails/widgets/course_details.widget.dart';
import 'package:masar/app/modules/myCourses/model/course.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'course_details.controller.dart';

class CourseDetailsPage extends GetView<CourseDetailsController> {
  const CourseDetailsPage({super.key, this.course});
  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: controller.scrollController,
        padding: EdgeInsets.all(16.r),
        children: [
          GetBuilder<CourseDetailsController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseDetailsWidget(course: course),
                16.hp,
                CourseDescriptionWidget(course: course),
                16.hp,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
