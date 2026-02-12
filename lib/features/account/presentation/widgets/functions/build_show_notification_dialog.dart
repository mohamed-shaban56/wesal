import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/l10n/app_localizations.dart';

Future<dynamic> buildShowNotificationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        AppLocalizations.of(context)!.notificationsEnabled,
        style: AppTextStyle.cairo18Bold(
          context,
        ).copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
        textAlign: TextAlign.center,
      ),
      content: Text(
        AppLocalizations.of(context)!.notificationsSettingsDescription,
        style: AppTextStyle.cairo14(context).copyWith(color: Colors.grey),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(width: 1, color: Colors.black),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          ),
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),

        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context);
            await openSettings(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          ),
          child: Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Future<void> openSettings(BuildContext context) async {
  try {
    await openAppSettings();
  } catch (e) {
    log('error in open setting is : $e');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('you cant open settings')));
  }
}
