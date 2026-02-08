import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

class PopulrResturentItem extends StatelessWidget {
  const PopulrResturentItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    final width = screenWidth * (80 / 392);
    final height = screenHeight * (80 / 884);
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.restaurant, color: Colors.grey),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("McDonald's", style: AppTextStyle.cairo16Bold(context)),
            SizedBox(height: 4.h),
            Text(
              "Burger • Fast Food • American",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.orange),
                Text(" 4.5", style: AppTextStyle.cairo14Bold(context)),
                Text(" (500+)", style: AppTextStyle.cairo14(context)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
