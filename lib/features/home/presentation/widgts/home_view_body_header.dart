import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/features/home/presentation/widgts/bottom_wav_clipper.dart';
import 'package:wesal/features/home/presentation/widgts/home_text_fild.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/l10n/app_localizations.dart';

class HomeViewBodyHeader extends StatelessWidget {
  const HomeViewBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
        color: AppColor.primaryColor,
        // Deep Orange
        padding: EdgeInsets.only(
          top: 50.h,
          left: 16.w,
          right: 16.w,
          bottom: 60.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.chooseDeliveryLocation,
                      style: AppTextStyle.cairo13(context),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.homeCairo,
                            style: AppTextStyle.cairo16Bold(context),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: AppColor.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.h),
            HomeTextFild(),
          ],
        ),
      ),
    );
  }
}
