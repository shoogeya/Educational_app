import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';


class CourseDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String courseName;

  const CourseDetailsAppBar({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(Icons.arrow_back, color: AppColors.primary),
      ),
      title: Text(
        courseName,
        style: AppTextStyles.b18.copyWith(color: AppColors.primary),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}