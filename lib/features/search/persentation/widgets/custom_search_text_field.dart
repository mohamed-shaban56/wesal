import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/l10n/app_localizations.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.onSubmitted,
  });

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: height * 0.045,
            width: height * 0.045,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        SizedBox(width: 20.w),
        Flexible(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            cursorColor: AppColor.lightGrey,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchHintRestaurants,
              hintStyle: AppTextStyle.cairo14Grey(context),
              filled: true,
              fillColor: AppColor.grey100,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 5.h,
              ),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              border: buildOutlineInputBorder(),
              prefixIcon: const Icon(Icons.search, color: AppColor.grey),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            // Navigate to cart page
          },
          child: Container(
            height: height * 0.045,
            width: height * 0.045,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(25.r),
    );
  }
}
