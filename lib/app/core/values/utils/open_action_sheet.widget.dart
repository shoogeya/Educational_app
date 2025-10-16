import 'package:masar/app_Imports.dart';
import 'package:flutter/cupertino.dart';
import '../../../sharedWidgets/selection_action.widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class OpenActionSheet<T> {
  Future<T?> showActionSheet({
    required items,
    required currentItem,
    bool hasSearch = false,
    bool isShowCountryCode = false,
    Widget? widgetNote,
  }) async {
    T? data = await showCupertinoModalPopup(
      context: Get.context!,
      builder: (c) => CupertinoActionSheet(
        actions: [
          SelectionActionWidget(
            currentItem: currentItem,
            hasSearch: hasSearch,
            items: items,
            widgetNote: widgetNote,
            isShowCountryCode: isShowCountryCode,
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
            FocusScope.of(Get.context!).unfocus();
          },
          child: Text(
            'إلغاء',
            style: AppTextStyles.sb16.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
    if (data != null) {
      return data;
    }
  }
}
