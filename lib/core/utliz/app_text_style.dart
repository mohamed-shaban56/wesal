import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_color.dart';

class AppTextStyle {
  static TextStyle cairo13(BuildContext context) {
    return const TextStyle(fontSize: 13, color: AppColor.white);
  }

  static TextStyle cairo16Bold(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,

      color: AppColor.white,
    );
  }

  static TextStyle cairo12Bold(BuildContext context) {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,

      color: Colors.black, // Default color for categories
    );
  }

  static TextStyle cairo18Bold(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,

      color: Colors.black,
    );
  }

  static TextStyle cairo14(BuildContext context) {
    return const TextStyle(fontSize: 14, color: AppColor.grey);
  }

  static TextStyle cairo14Bold(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo17Bold(BuildContext context) {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo14BoldPrimary(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,

      color: AppColor.primaryColor,
    );
  }
}
