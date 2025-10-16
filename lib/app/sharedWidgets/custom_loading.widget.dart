import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading.widget.dart';

class CustomLoadingWidget extends StatelessWidget {
   CustomLoadingWidget({
    super.key,
    this.scaffoldColor,
  });

   Color? scaffoldColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: scaffoldColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const LoadingWidget(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

