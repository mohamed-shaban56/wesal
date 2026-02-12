import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';

class AppTextStyle {
  static TextStyle cairo13(BuildContext context) {
    return TextStyle(fontSize: 13.sp, color: AppColor.white);
  }

  static TextStyle cairo16Bold(BuildContext context) {
    return TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  }

  static TextStyle cairo12Bold(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo18Bold(BuildContext context) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo14(BuildContext context) {
    return TextStyle(fontSize: 14.sp, color: AppColor.grey);
  }

  static TextStyle cairo14Bold(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo17Bold(BuildContext context) {
    return TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo14BoldPrimary(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor,
    );
  }

  // New styles for search feature
  static TextStyle cairo24BoldBlack(BuildContext context) {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo16BoldBlack(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle cairo12BoldPrimary(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor,
    );
  }

  static TextStyle cairo13Black87(BuildContext context) {
    return TextStyle(fontSize: 13.sp, color: Colors.black87);
  }

  static TextStyle cairo12BoldBlack600(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle cairo12Grey(BuildContext context) {
    return TextStyle(fontSize: 12.sp, color: AppColor.grey);
  }

  static TextStyle cairo14Grey(BuildContext context) {
    return TextStyle(fontSize: 14.sp, color: AppColor.grey);
  }
}
