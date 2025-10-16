import 'package:intl/intl.dart';
import 'package:masar/app/core/managers/user.manager.dart';
import 'package:masar/app/sharedWidgets/app_alert.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/providers/local_storage_provider.dart';
import '../../layout/main_navigation.controller.dart';
import '../../sharedWidgets/attention_dialog.widget.dart';
import '../values/assets/app_icons.dart';

String platform_issues =
    'قد يكون النظام الأساسي قيد الصيانة، يرجى المحاولة مرة أخرى لاحقًا.';

String error_message = 'حدث خطأ ما';
String convertToDate(String dateTimeString) {
  // Parse the input string to a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Create a DateFormat instance to format the date
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  // Format the DateTime object
  String formattedDate = dateFormat.format(dateTime);

  return formattedDate;
}

void showAlert(message,
    {Function()? onSuccess,
    Function()? onCancel,
    String? cancelText,
    String? title,
    String? icon,
    String? okText,String? imageConf,}) {
  Get.dialog(
    AppAlertWidget(
      imageConf: imageConf,
      description: message.toString(),
      title: title,
      cancelText: cancelText,
      icon: icon,
      okText: okText,
      onCancel: () {
        Get.back();
        if (onCancel != null) {
          onCancel();
        }
      },
      onTap: () {
        Get.back();
        if (onSuccess != null) {
          onSuccess();
        }
      },
    ),
  );
}

void closeDrawer() {
  if (Get.find<MainNavigationController>()
          .scaffoldKey
          .currentState
          ?.isDrawerOpen ==
      true) {
    Get.find<MainNavigationController>()
        .scaffoldKey
        .currentState
        ?.closeDrawer();
    Get.find<MainNavigationController>()
        .scaffoldKey
        .currentState
        ?.closeEndDrawer();
    Get.find<MainNavigationController>().update();
  }
}

void showError(message, {Function()? onTap, String? cancelText}) {
  Get.dialog(
    AttentionDialog(
      description: message.toString(),
      iconColor: Colors.red.shade700,
      title: "خطأ",
      cancelText: cancelText,
      //toDO: Change lockIcon
      icon: AppIcons.instance.lockIcon,
      onTap: () {
        Get.back();
        if (onTap != null) {
          onTap();
        }
      },
    ),
  );
}

void showSuccess(String message, {Function()? onSuccess}) {
  Get.dialog(
    AttentionDialog(
      description: message,
      // iconColor: AppColors.secondaryNew,
      title: 'تهانينا !',
      //toDO: Change lockIcon
      icon: AppIcons.instance.lockIcon,
      onTap: () {
        Get.back();
        if (onSuccess != null) {
          onSuccess();
        }
      },
    ),
  );
}

void onSuccessAuth(result) async {
  LocalStorageProvider.instance.setIsAuth(value: true);
  // Get.find<UserManager>().addFCMToken(result?.token ?? "");
  LocalStorageProvider.instance.setUserType(result?.user?.userType.id ?? 0);
  await LocalStorageProvider.instance.setToken(result?.token ?? "");
  // await LocalStorageProvider.instance.saveUser(UserModel(
  //     gender: result?.user?.gender,
  //     userID: result?.user?.userID,
  //     email: result?.user?.email,
  //     username: result?.user?.username,
  //     firstName: result?.user?.firstName,
  //     lastName: result?.user?.lastName,
  //     phoneDailingCode: result?.user?.phoneDailingCode,
  //     phoneNumber: result?.user?.phoneNumber,
  //     countryID: result?.user?.countryID,
  //     cityID: result?.user?.cityID,
  //     dateOfBirth: result?.user?.dateOfBirth,
  //     rule: result?.user?.rule,
  //     image: result?.user?.image,
  //     isNotificationEnabled: result?.user?.isNotificationEnabled));
  // Get.find<UserManager>().getFcm();
  // Get.find<UserManager>().addFCMToken(result?.token ?? "");
}


void makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $launchUri';
  }
}

void openWhatsApp(String phoneNumber) async {
  final String whatsappUrl =
      "https://wa.me/$phoneNumber"; // Format: https://wa.me/phoneNumber
  final Uri launchUri = Uri.parse(whatsappUrl);
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $launchUri';
  }
}

void sendEmail(String toEmail, String subject, String body) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: toEmail,
    query: Uri.encodeFull('subject=$subject&body=$body'),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}

void openFacebook(String facebookUrl) async {
  final Uri url = Uri.parse(facebookUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void openInstagramProfile(String instagramUsername) async {
  final String instagramUrl = 'https://www.instagram.com/$instagramUsername/';
  final Uri url = Uri.parse(instagramUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}


