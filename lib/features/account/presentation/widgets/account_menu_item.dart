import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  final Widget? trailing;

  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          leading: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColor.primaryColorLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColor.primaryColor, size: 20.r),
          ),
          title: Text(
            title,
            style: AppTextStyle.cairo14BoldPrimary(context).copyWith(
              color: Colors.black87,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing:
              trailing ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.r,
                color: AppColor.extraLightGrey,
              ),
        ),

        Divider(
          height: 1,
          thickness: 1,
          color: AppColor.extraLightGrey,
          indent: 16.w,
          endIndent: 16.w,
        ),
      ],
    );
  }
}
