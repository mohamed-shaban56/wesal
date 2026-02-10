import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/l10n/app_localizations.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.08), // Very subtle red background
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.red.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: Colors.red, size: 20.r),
            SizedBox(width: 8.w),
            Text(
              AppLocalizations.of(context)!.logout,
              style: AppTextStyle.cairo14BoldPrimary(
                context,
              ).copyWith(color: Colors.red, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
