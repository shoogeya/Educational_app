import 'package:masar/app/core/values/utils/global_variable.dart';
import 'package:masar/app/layout/widgets/bottom_nav.widget.dart';
import 'package:masar/app/layout/widgets/general_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'app_drawer.dart';
import 'main_navigation.controller.dart';

class MainNavigationLayout extends StatelessWidget {
  const MainNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: GlobalVariable.instance.white,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            endDrawerEnableOpenDragGesture: true,
            drawerEdgeDragWidth: 10,
            drawerEnableOpenDragGesture: true,
            key: controller.scaffoldKey,
            backgroundColor: Colors.white,
            drawerScrimColor: Colors.transparent,
            drawer: AppDrawer(),
            appBar: GeneralAppBar(),
            bottomNavigationBar: BottomNavWidget(),
            body: SafeArea(
              child: controller.pages[controller.index].page,
            ),
          ),
        );
      },
    );
  }
}
