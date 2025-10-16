import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class GlobalFunctions {
  GlobalFunctions._();

  static GlobalFunctions instance = GlobalFunctions._();

  void changeScrollOffset(
    final ScrollController scrollController, {
    double? offset,
    int? duration,
  }) {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        offset ?? 0.0,
        duration: Duration(milliseconds: duration ?? 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  String? phoneValidation(String? value) {
    if (value?.isEmpty == true || value == null) {
      return 'phone_req'.tr;
    }
    int allLength = value.length;
    allLength = allLength;
    if (allLength < 9) {
      return "phone_error".tr;
    }
    if (value.toString().trim() != "") {
      return null;
    } else {
      return 'phone_req'.tr;
    }
  }

  hiddenKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  void showDatePickerWidget({
    required DateTime minDateTime,
    required DateTime maxDateTime,
    required DateTime initialDateTime,
    required Function() onClose,
    Function(DateTime dateTime)? onChange,
    required Function(DateTime? dateTime) onConfirm,
  }) {
    DateTime? finalValue = initialDateTime;
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        barrierDismissible: false,
        semanticsDismissible: true,
        context: Get.context!,
        builder: (BuildContext builder) {
          return Container(
            height: .43.sh,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      height: 20,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.b15.copyWith(
                          //color: AppColors.black1c,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        onClose();
                      },
                    ),
                    MaterialButton(
                      height: 20,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Text(
                        "Done",
                        style: AppTextStyles.b15.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        onConfirm(
                          finalValue,
                        );
                      },
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.2,
                ),
                Flexible(
                  child: CupertinoDatePicker(
                    initialDateTime: initialDateTime,
                    minimumYear: minDateTime.year,
                    maximumDate: maxDateTime,
                    maximumYear: maxDateTime.year,
                    mode: CupertinoDatePickerMode.date,

                    use24hFormat: true,
                    onDateTimeChanged: (DateTime? value) {
                      if (value != null) {
                        finalValue = value;
                      } else {
                        finalValue = null;
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
      return;
    }
    showDatePicker(
      keyboardType: TextInputType.datetime,
      context: Get.context!,
      initialDate: initialDateTime,
      lastDate: maxDateTime,
      firstDate: minDateTime,
      locale: const Locale('en'),
    ).then(
      (value) {
        if (value != null) {
          onConfirm(value);
          finalValue = value;
        } else {
          onClose();
          finalValue = null;
        }
      },
    );
  }

  showCustomBottomSheet(
    Widget child, {
    Function()? onTapCancelButton,
    EdgeInsetsGeometry? margin,
    bool isShowCancelButton = true,
  }) {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: isShowCancelButton == false
                ? EdgeInsets.zero
                : margin ??
                    EdgeInsetsDirectional.only(
                      start: 5.5.w,
                      end: 5.5.w,
                    ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 12,
                    blurStyle: BlurStyle.inner),
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: -12.0,
                    blurRadius: 12.0,
                    offset: Offset(0, 3),
                    blurStyle: BlurStyle.inner),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  12.r,
                ),
                topRight: Radius.circular(
                  12.r,
                ),
              ),
            ),
            width: 1.sw,
            child: child,
          ),
          // if (isShowCancelButton)
          //   Padding(
          //     padding: isShowCancelButton == false
          //         ? EdgeInsets.zero
          //         : margin ??
          //             EdgeInsetsDirectional.only(
          //               start: 5.5.w,
          //               end: 5.5.w,
          //               bottom: 10.h,
          //             ),
          //     child: CancelButtonBottomSheetWidget(
          //       onTap: onTapCancelButton,
          //     ),
          //   ),
        ],
      ),
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      ignoreSafeArea: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      elevation: 13.6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(
            12.r,
          ),
          topStart: Radius.circular(
            12.r,
          ),
        ),
      ),
    );
  }

  void closeDialogs() {
    while (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  void closeDrawer() {
  }

  backToMain(int index) {
  }

  setPreferredOrientation(DeviceOrientation orientation) {
    SystemChrome.setPreferredOrientations([orientation]);
  }
}
