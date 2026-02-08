import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

Widget buildCategoryItem(BuildContext context, IconData icon, String label) {
  double screenHeight = MediaQuery.sizeOf(context).height;
  double screenWidth = MediaQuery.sizeOf(context).width;
  final width = screenWidth * (60 / 392);
  final height = screenHeight * (60 / 884);
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGrey,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(icon, color: AppColor.primaryColor, size: 30),
      ),
      SizedBox(height: 8.h),
      Text(label, style: AppTextStyle.cairo12Bold(context)),
    ],
  );
}
