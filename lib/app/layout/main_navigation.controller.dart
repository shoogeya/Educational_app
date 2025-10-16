import 'package:masar/app/layout/widgets/page_data.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/values/assets/app_icons.dart';
import '../data/models/action_selectable.dart';
import '../modules/myCourses/my_cources.page.dart';
class MainNavigationController extends GetxController {
  static MainNavigationController get to =>
      Get.find<MainNavigationController>();
  int index = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late List<PageData> pages;
  ActionSelectable? typeOfUploaded;

  @override
  void onInit() {
    setPages();
    super.onInit();
  }

  setPages() {
    pages = [
        PageData(
            id: 2,
            page:  MyCoursesPage(),
            icon: AppIcons.instance.library,
            title: "كورساتي"),
    ];
  }

  reInitPages({bool loadingValue = false,bool isFromLogout = false}) {
    scaffoldKey = GlobalKey<ScaffoldState>();
    index = 0;
    setPages();
    update();
  }

  changePage(int newIndex) async {
    if (index == newIndex) {
      return;
    }
    index = newIndex;

    update();
  }
}
