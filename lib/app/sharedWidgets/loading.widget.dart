import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color? loadingColor;

  const LoadingWidget({super.key, this.loadingColor});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.hexagonDots(
        color: AppColors.primary,
        size: 40,
      ),
    );
  }
}
