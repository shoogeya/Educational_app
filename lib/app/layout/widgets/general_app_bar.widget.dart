import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../main_navigation.controller.dart';
import 'home_app_bar.widget.dart';

class GeneralAppBar extends GetView<MainNavigationController>
    implements PreferredSizeWidget {
  const GeneralAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
    child: HomeAppBarWidget(),);
        // child: controller.pages[controller.index].id == 0
        //     ? const HomeAppBarWidget()
        //     : Container(child: Center(child: Text("${controller.pages[controller.index].title}"),),));
  }

  // _buildAppBar() {
  //   if (controller.pages[controller.index].id == 0) {
  //     return Visibility(
  //       visible: (LocalStorageProvider.instance.isAuthenticate != true) ||
  //           (LocalStorageProvider.instance.userType == UserTypes.sme),
  //       replacement: MainAppBar(
  //         "home".tr,
  //         showNotification: true,
  //         isShowLogo: true,
  //       ),
  //       child: MainAppBar(
  //         LocalStorageProvider.instance.isAuthenticate == true ? "home".tr : '',
  //         isShowLogo: true,
  //         showNotification: false,
  //       ),
  //     );
  //   } else if (controller.pages[controller.index].id == 1) {
  //     return MainAppBar(
  //       "kyc".tr,
  //     );
  //   } else if (controller.pages[controller.index].id == 2) {
  //     return MainAppBar(
  //       "wallet".tr,
  //       showChangeCurrency: true,
  //     );
  //   } else if (controller.pages[controller.index].id == 3) {
  //     return PreferredSize(
  //       preferredSize: Size(
  //         1.sw,
  //         AppBar().preferredSize.height,
  //       ),
  //       child: GetBuilder<InvestorDashboardController>(
  //         id: 'image',
  //         builder: (logic) {
  //           return MainAppBar(
  //             "dashboard".tr,
  //             showImage: true,
  //             showNotification: false,
  //             imageUrl: logic.imageURl.value,
  //           );
  //         },
  //       ),
  //     );
  //   } else if (controller.pages[controller.index].id == 4) {
  //     return MainAppBar(
  //       "notification".tr,
  //       showNotification: false,
  //     );
  //   } else if (controller.pages[controller.index].id == 5) {
  //     return GetBuilder<SmeDashboardController>(
  //       id: 'image',
  //       builder: (logic) {
  //         return MainAppBar(
  //           "dashboard".tr,
  //           showImage: true,
  //           showNotification: false,
  //           imageUrl: logic.imageURl.value,
  //         );
  //       },
  //     );
  //   } else if (controller.pages[controller.index].id == 6) {
  //     return MainAppBar(
  //       "secondary_marketplace".tr,
  //       showNotification: false,
  //       isShowLogo: false,
  //       showChangeCurrency: false,
  //       showImage: false,
  //     );
  //   }
  //   return MainAppBar(
  //     "".tr,
  //   );
  // }

  @override
  Size get preferredSize => Size(
        1.sw,
        AppBar().preferredSize.height + 40.h
    ,
      );
}
