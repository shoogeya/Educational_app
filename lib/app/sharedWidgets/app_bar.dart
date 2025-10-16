import 'package:masar/app/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/theme/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
   AppBarWidget({Key? key, required this.title, this.child,this.isBackButtonHiden}) : super(key: key);
   String title;
   Widget? child;
  bool? isBackButtonHiden = false;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        AppBar().preferredSize.width,
        70,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: !(isBackButtonHiden ?? false),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Visibility(
                visible: (isBackButtonHiden ?? true),
                child:  Expanded(child: Container()),
              ),
              Expanded(child: Container()),
              Text(
                title,
                style: AppTextStyles.b20.copyWith(color: AppColors.primary),
              ),
              if (child != null) ...[
                Expanded(child: Container()),
              ],
              Expanded(flex: child != null ? 1 : 2, child: child ?? Container())
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        const Spacer(),
        Text('data')
      ],
    ),
  );
}
