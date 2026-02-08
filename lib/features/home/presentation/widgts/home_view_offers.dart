import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';

class HomeViewBodyOffers extends StatelessWidget {
  const HomeViewBodyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    final height = screenHeight * (200 / 884);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.lightOrange,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
