import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/values/assets/app_images.dart';
import 'package:masar/app/routes/app_routes.dart';
import 'package:masar/app/sharedWidgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/values/utils/enum.dart';
import '../../sharedWidgets/no_data.widget.dart';
import '../favorite/widgets/cources_favrite_item.widget.dart';
import 'my_cources.controller.dart';

class MyCoursesPage extends GetView<MyCoursesController> {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Get.currentRoute == AppRoutes.main
          ? null
          : AppBar(
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
          "كورساتي",
          style: AppTextStyles.b18.copyWith(color: AppColors.primary),
        ),
      ),
      body: GetBuilder<MyCoursesController>(
        initState: (_){
          controller.getRegisteredCoursesAction();
        },
          builder: (controller){
        return ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            SizedBox(
              height: 150.h,
              child: CustomCard(
                borderRadius: 6,
                color: AppColors.colorBAD6FF,
                child: Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppImages.instance.studantReport),
                      25.wp,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "لقد اشتركت ب ${controller.courses.length}  كورسات",
                              style: AppTextStyles.b20
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            16.hp,
            Text(
              "الكورسات المشترك بها",
              style: AppTextStyles.b20.copyWith(color: AppColors.primary),
            ),
            16.hp,
            ListView.separated(
                padding: EdgeInsets.all(16.0.r),
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                controller.courses.length != 0
                    ?  CoursesFavoriteItemWidget(
                  courseType: CourseEnum.basicCourse,
                  course: controller.courses[index],
                )
                    : SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: NoDataFoundWidget(),
                ),
                separatorBuilder: (context, i) => 16.hp,
                itemCount: controller.courses.length != 0
                    ? controller.courses.length
                    : 1)
          ],
        );
      }),
    );
  }
}
