import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
extension SizedBoxExtension on num {
  Widget get hp => toDouble().verticalSpace;

  Widget get wp => toDouble().horizontalSpace;
}
extension DateFormatExtension on DateTime {
  String formatDateToString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
extension StringFormatExtension on String {
  String formatDate({String inputFormat = 'yyyy-MM-dd', String outputFormat = 'yyyy-MM-dd'}) {
    try {
      final DateTime dateTime = DateFormat(inputFormat).parse(this);
      return DateFormat(outputFormat).format(dateTime);
    } catch (e) {
      // Handle error (e.g., log it or return an empty string)
      return '';
    }
  }
}

