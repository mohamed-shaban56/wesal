import 'package:flutter/material.dart';

class AppColor {
  static const bottomNavigationBarInActiveColr = Color(0xff8E8C8F);
  static const primaryColor = Color(0xffFF5722);
  static const primaryColorLight = Color(0x1AFF5722);

  static const grey = Color(0xff9E9E9E);
  static const lightGrey = Color(0x809E9E9E);
  static const extraLightGrey = Color(0x1A9E9E9E);
  static const white = Colors.white;
  static const lightOrange = Color(0xffFFF3E0);
  static const darkOrange = Color(0xffE64A19);
  static const purple = Color(0xff7B1FA2);
  static const lightBlue = Color(0x800000FF);
  static const lightDark = Color(0xff260000);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey20 = Color(0x339E9E9E);
  static const grey10 = Color(0x1A9E9E9E);
  static const grey05 = Color(0x0D9E9E9E);

  Color accountMenuSectionColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColor.white
        : AppColor.lightDark.withOpacity(0.4);
  }
}
