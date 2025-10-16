import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/core/theme/app_text_styles.dart';
import 'package:masar/app/core/values/assets/app_icons.dart';
import 'package:masar/app/core/values/assets/app_images.dart';
import 'package:masar/app/layout/main_navigation.controller.dart';
import 'package:masar/app/routes/app_routes.dart';
import 'package:masar/app/sharedWidgets/custom_icon_button_with_background.widget.dart';
import 'package:masar/app_Imports.dart';
class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(builder: (controller){
      return Padding(
        padding: EdgeInsets.only(left: 10.w, top: 16.h, right: 16.w),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.personInformation);
                      },
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: "", // URL of the image
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
                    ),
                    16.wp,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أهلا وسهلا بك",
                          style: AppTextStyles.b15,
                        ),
                      ],
                    )
                  ],
                )),
            Row(
              children: [
                IconButtonWithBackgroundWidget(
                    icon: AppIcons.instance.menu,
                    onPressed: () {
                      Get.find<MainNavigationController>()
                          .scaffoldKey
                          .currentState
                          ?.openDrawer();
                    }),
              ],
            )
          ],
        ),
      );
    });
  }
}
