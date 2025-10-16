import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/values/utils/enum.dart';
import 'package:masar/app/modules/favorite/favorite.controller.dart';
import 'package:masar/app/modules/favorite/widgets/cources_favrite_item.widget.dart';
import 'package:masar/app/sharedWidgets/no_data.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';


class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          "المفضلة",
          style: AppTextStyles.b18.copyWith(color: AppColors.primary),
        ),
      ),
      body: ListView(
        children: [
          GetBuilder<FavoriteController>(
            initState: (_){
              controller.getFavouriteCoursesAction();
            },
              builder: (controller) {
            return ListView.separated(
                controller: controller.courseScrollController,
                padding: EdgeInsets.all(16.0.r),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => controller.courses.length == 0 ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: NoDataFoundWidget(),
                ) :
                CoursesFavoriteItemWidget(courseType: CourseEnum.basicCourse,course: controller.courses[i],isFromFaVPage: true,),
                separatorBuilder: (context, i) => 16.hp,
                itemCount: controller.courses.length == 0 ? 1 : controller.courses.length);
          }),
        ],
      ),
    );
  }
}
