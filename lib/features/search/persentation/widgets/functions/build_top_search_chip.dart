import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

Widget buildTopSearchChip(BuildContext context, String label, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppColor.grey20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: AppColor.primaryColor),
        SizedBox(width: 6.w),
        Text(label, style: AppTextStyle.cairo13Black87(context)),
      ],
    ),
  );
}
