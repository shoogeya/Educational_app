import 'dart:ui';
import 'package:masar/app/core/extentions/app_extention.dart';
import 'package:masar/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../main_navigation.controller.dart';

class MenuItemModel {
  String title;
  bool isClicked;
  Function? onTap;
  List<SubMenuItem>? subItems;
  Color? titleColor;

  MenuItemModel(
      {required this.title,
      this.subItems,
      this.onTap,
      this.titleColor,
      this.isClicked = false});

  static List<MenuItemModel> getMenuItems() {
    List<MenuItemModel> toReturn = [];
    toReturn = [
      MenuItemModel(
        title: "🏫 الصفحة الرئيسية",
        titleColor: MainNavigationController.to.index == 0
            ? AppColors.primary
            : AppColors.grayTextColor,
        onTap: () {
          Get.back();
          if (MainNavigationController.to.index != 0) {
            MainNavigationController.to.changePage(0);
          }
        },
      ),
      MenuItemModel(
        title: "👨‍🏫 الملف الشخصي",
        titleColor: AppColors.primary,
        onTap: () {
          Get.back();
          Get.toNamed(AppRoutes.personInformation);
        },
      ),
      MenuItemModel(
        title: "📝اختباراتي",
        onTap: () {
        },
      ),
    MenuItemModel(
        title: "📂 التنزيلات",
        onTap: () {
          Get.toNamed(AppRoutes.downloads);
        },
      ),
      MenuItemModel(
        title: "❔ الأسئلة الشائعة",
        onTap: () {
          Get.toNamed(AppRoutes.FAQ);
        },
      ),
      MenuItemModel(
        title: "ℹ️من نحن",
        subItems: [
          SubMenuItem(
            title: "",
            onTap: () {
            },
          ),
          SubMenuItem(
            title: "سياسة الخصوصية",
            onTap: () {
            },
          ),
        ],
      ),
      MenuItemModel(
        title: "📲 تواصل معنا",
        onTap: () {
          Get.toNamed(AppRoutes.contactUs);
        },
      ),
      MenuItemModel(
        title: "⚙️  الإعدادات",
        onTap: () {
          Get.toNamed(AppRoutes.settings);
        },
      ),
      MenuItemModel(
        title: "🚪 تسجيل الخروج",
        onTap: () {
          showAlert(
            title: "تنبيه",
            cancelText: "إلغاء",
            "هل أنت متأكد أنك تريد تسجيل الخروج؟",
            okText: "تأكيد",
            onSuccess: () {

            },
          );
        },
      ),
    ];
    return toReturn;
  }
}

class SubMenuItem {
  String title;
  Function() onTap;

  SubMenuItem({
    required this.title,
    required this.onTap,
  });
}
