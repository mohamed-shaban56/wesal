import 'package:flutter/material.dart';
import 'package:wesal/features/search/persentation/views/search_view.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

import 'package:wesal/l10n/app_localizations.dart';

class HomeTextFild extends StatelessWidget {
  const HomeTextFild({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SearchView.id),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(Icons.search, color: AppColor.grey),
              SizedBox(width: 10),
              Text(
                AppLocalizations.of(context)!.searchHint,
                style: AppTextStyle.cairo14(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
