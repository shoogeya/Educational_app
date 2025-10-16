import 'package:masar/app/core/extentions/base_extention.dart';
import 'package:masar/app/layout/widgets/menu_item_model.dart';
import '../../app_Imports.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<MenuItemModel> menuItems = [];

  @override
  void initState() {
    super.initState();
    menuItems = MenuItemModel.getMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (_) {
      return SafeArea(
        bottom: false,
        child: Drawer(
          width: 1.sw - 80,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(
                40.r,
              ),
            ),
          ),
          child: SafeArea(
            child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(
                  40.r,
                ),
              ),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.46),
                      offset: const Offset(8, 1),
                      blurRadius: 18,
                      spreadRadius: 9,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(
                      40.r,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                ),
                child: Column(
                  children: [
                    24.hp,
                    Row(children: [
                      16.wp,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("أهلا وسهلا بك",style: AppTextStyles.b18,),
                          // 6.hp,
                          Text(
                            "",
                            style: AppTextStyles.r15,
                          ),

                        ],
                      )
                    ],),
                    16.hp,
                    Divider(color: AppColors.grayTextColor,height: 1.h,),
                    16.hp,
                    Expanded(
                      child: ListView.separated(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) => MenuItemWidget(
                          menuItems[index],
                        ),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 12,
                          );
                        },
                      ),
                    ),
                    10.hp
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget MenuItemWidget(MenuItemModel menuItem) {
    return GestureDetector(
      onTap: () {
        for (var element in menuItems) {
          element.isClicked = false;
        }
        menuItem.isClicked = true;
        if (mounted) {
          setState(() {});
        }
        if (menuItem.onTap != null) {
          menuItem.onTap!();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCirc,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4.r,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsetsDirectional.only(
          start: 10.w,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (menuItem.subItems?.isNotEmpty == true) {
                  bool current = menuItem.isClicked;
                  if (menuItem.subItems?.isNotEmpty == true) {
                    for (var element in menuItems) {
                      element.isClicked = false;
                    }
                    menuItem.isClicked = !current;

                    if (mounted) {
                      setState(() {});
                    }
                  }
                } else {
                  for (var element in menuItems) {
                    element.isClicked = false;
                  }
                  menuItem.isClicked = true;
                  if (mounted) {
                    setState(() {});
                  }
                  if (menuItem.onTap != null) {
                    menuItem.onTap!();
                  }
                }
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    menuItem.title.tr,
                    style: AppTextStyles.r15.copyWith(
                      color: menuItem.titleColor ?? AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (menuItem.subItems?.isNotEmpty == true)
                    GestureDetector(
                      onTap: () {
                        bool current = menuItem.isClicked;
                        if (menuItem.subItems?.isNotEmpty == true) {
                          for (var element in menuItems) {
                            element.isClicked = false;
                          }
                          menuItem.isClicked = !current;

                          if (mounted) {
                            setState(() {});
                          }
                        }
                      },
                      child: Icon(
                        !menuItem.isClicked
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up_outlined,
                        color: AppColors.primary,
                        weight: 1.2,
                      ),
                    )
                ],
              ),
            ),
            if (menuItem.isClicked)
              SizedBox(
                height: 10.h,
              ),
            if (menuItem.isClicked)
              ...menuItem.subItems?.map<Widget>((sub) {
                return AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  color: Colors.white,
                  padding: EdgeInsetsDirectional.only(
                      start: 24,
                      top: 14,
                      bottom: menuItem.subItems?.last.title == sub.title
                          ? 5
                          : 14),
                  child: GestureDetector(
                    onTap: () {
                      sub.onTap();
                    },
                    child: Text(
                      sub.title.tr,
                      style: AppTextStyles.r14.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                );
              }).toList() ??
                  []
          ],
        ),
      ),
    );
  }
}
