import 'package:flutter/cupertino.dart';

class PageData {
  int id;
  String icon;
  Widget page;
  String title;

  PageData({required this.id, required this.page, required this.icon,required this.title});
}