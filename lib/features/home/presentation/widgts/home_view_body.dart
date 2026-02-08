import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/home/presentation/widgts/home_view_body_category.dart';
import 'package:wesal/features/home/presentation/widgts/home_view_body_header.dart';
import 'package:wesal/features/home/presentation/widgts/home_view_offers.dart';
import 'package:wesal/features/home/presentation/widgts/popular_resturants_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Orange Header & Search
          HomeViewBodyHeader(),

          SizedBox(height: 16.h),

          // 3. Categories Grid
          HomeViewBodyCategory(),

          SizedBox(height: 24.h),

          // 4. offers
          HomeViewBodyOffers(),

          SizedBox(height: 24.h),
          PopularRestaruntsSection(),
        ],
      ),
    );
  }
}
