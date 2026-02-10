import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/features/account/presentation/manager/language_cubit/language_cubit.dart';
import 'package:wesal/l10n/app_localizations.dart';

class LnaguageModelButtonSheetChild extends StatelessWidget {
  const LnaguageModelButtonSheetChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 33.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(child: Icon(Icons.close, color: Colors.red)),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              AppLocalizations.of(context)!.language,
              style: AppTextStyle.cairo17Bold(context),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        TextButton(
          onPressed: () async {
            context.read<LanguageCubit>().changeLanguage(Locale('en'));
            await Future.delayed(Duration(milliseconds: 50));
            Navigator.pop(context);
          },
          child: Text('English', style: AppTextStyle.cairo14Bold(context)),
        ),

        TextButton(
          onPressed: () async {
            context.read<LanguageCubit>().changeLanguage(Locale('ar'));
            await Future.delayed(Duration(milliseconds: 50));
            Navigator.pop(context);
          },
          child: Text('العربيه', style: AppTextStyle.cairo14Bold(context)),
        ),
      ],
    );
  }
}
