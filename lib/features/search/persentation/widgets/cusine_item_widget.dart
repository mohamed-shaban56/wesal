import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/features/search/data/models/popular_cusine_model.dart';

class CusineItemWidget extends StatelessWidget {
  const CusineItemWidget({super.key, required this.popularCusineModel});
  final PopularCusineModel popularCusineModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.20,

      margin: EdgeInsets.only(right: 16.w),
      child: Column(
        children: [
          Container(
            height: height * 0.07,
            width: width * 0.15,
            decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2.h),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(popularCusineModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            popularCusineModel.titel,
            textAlign: TextAlign.center,
            style: AppTextStyle.cairo12Bold(context),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
