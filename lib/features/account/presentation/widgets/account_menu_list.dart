import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/account/presentation/widgets/account_menu_item.dart';
import 'package:wesal/features/account/presentation/widgets/account_menu_section.dart';
import 'package:wesal/features/account/presentation/widgets/custom_switch_widgt.dart';
import 'package:wesal/features/account/presentation/widgets/functions/build_language_model_sheet.dart';
import 'package:wesal/features/account/presentation/widgets/logout_button.dart';
import 'package:wesal/l10n/app_localizations.dart';

class AccountMenuList extends StatelessWidget {
  const AccountMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section 1: Personal Info
        AccountMenuSection(
          children: [
            AccountMenuItem(
              icon: Icons.person_outline,
              title: AppLocalizations.of(context)!.editAccount,
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.location_on_outlined,
              title: AppLocalizations.of(context)!.myAddresses,
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.lock_outline,
              title: AppLocalizations.of(context)!.changePassword,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Section 2: My Activity
        AccountMenuSection(
          children: [
            AccountMenuItem(
              icon: Icons.shopping_bag_outlined,
              title: AppLocalizations.of(context)!.myOrders,
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.account_balance_wallet_outlined,
              title: AppLocalizations.of(context)!.wallet,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Section 3: Preferences
        AccountMenuSection(
          children: [
            AccountMenuItem(
              icon: Icons.dark_mode_outlined,
              title: AppLocalizations.of(context)!.darkMode,
              trailing: CustomSwitchWidget(),
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.notifications_outlined,
              title: AppLocalizations.of(context)!.notifications,
              trailing: CustomSwitchWidget(),
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.language,
              title: AppLocalizations.of(context)!.language,
              trailing: Text(
                AppLocalizations.of(context)!.arabic,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),

              onTap: () {
                buildLanguageModelSheet(context);
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Section 4: Support
        AccountMenuSection(
          children: [
            AccountMenuItem(
              icon: Icons.help_outline,
              title: AppLocalizations.of(context)!.helpAndFaq,
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: AppLocalizations.of(context)!.privacyPolicy,
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.description_outlined,
              title: AppLocalizations.of(context)!.termsOfUse,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 32.h),

        // Enhanced Logout Button
        LogoutButton(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
