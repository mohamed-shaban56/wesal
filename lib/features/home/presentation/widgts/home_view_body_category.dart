import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/home/presentation/widgts/function/build_Category_item.dart';
import 'package:wesal/l10n/app_localizations.dart';

class HomeViewBodyCategory extends StatelessWidget {
  const HomeViewBodyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCategoryItem(
            context,
            Icons.lunch_dining,
            AppLocalizations.of(context)!.burger,
          ),
          buildCategoryItem(
            context,
            Icons.local_pizza,
            AppLocalizations.of(context)!.pizza,
          ),
          buildCategoryItem(
            context,
            Icons.restaurant,
            AppLocalizations.of(context)!.chicken,
          ),
          buildCategoryItem(
            context,
            Icons.dinner_dining,
            AppLocalizations.of(context)!.meals,
          ),
          buildCategoryItem(
            context,
            Icons.store,
            AppLocalizations.of(context)!.more,
          ),
        ],
      ),
    );
  }
}
