import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wesal/features/home/presentation/widgts/popular_resturant_item.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

import 'package:wesal/l10n/app_localizations.dart';

class PopularRestaruntsSection extends StatelessWidget {
  const PopularRestaruntsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.popularRestaurants,
                style: AppTextStyle.cairo18Bold(context),
              ),
              Text(
                AppLocalizations.of(context)!.seeAll,
                style: AppTextStyle.cairo14BoldPrimary(context),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) => PopulrResturentItem(),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
