import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

Widget sectionHeader(
  BuildContext context,
  String title, {
  VoidCallback? onDelete,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: AppTextStyle.cairo16BoldBlack(context)),
      if (onDelete != null)
        GestureDetector(
          onTap: onDelete,
          child: Text(
            'Clear all',
            style: AppTextStyle.cairo12BoldPrimary(context),
          ),
        ),
    ],
  );
}
