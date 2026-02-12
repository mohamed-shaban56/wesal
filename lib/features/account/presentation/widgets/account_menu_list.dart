import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wesal/features/account/presentation/widgets/account_menu_item.dart';
import 'package:wesal/features/account/presentation/widgets/account_menu_section.dart';
import 'package:wesal/features/account/presentation/widgets/custom_switch_widgt.dart';
import 'package:wesal/features/account/presentation/widgets/functions/build_language_model_sheet.dart';
import 'package:wesal/features/account/presentation/widgets/functions/build_show_notification_dialog.dart';
import 'package:wesal/features/account/presentation/widgets/logout_button.dart';
import 'package:wesal/features/payment/presentation/views/payment_details_view.dart';
import 'package:wesal/l10n/app_localizations.dart';

import 'package:permission_handler/permission_handler.dart';

class AccountMenuList extends StatefulWidget {
  const AccountMenuList({super.key});

  @override
  State<AccountMenuList> createState() => _AccountMenuListState();
}

class _AccountMenuListState extends State<AccountMenuList>
    with WidgetsBindingObserver {
  bool? isNotificationEnabled;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNotificationPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkNotificationPermission();
    }
  }

  Future<void> _checkNotificationPermission() async {
    try {
      final status = await Permission.notification.status;
      if (mounted) {
        setState(() {
          isNotificationEnabled = status.isGranted;
        });
      }
    } catch (e) {
      debugPrint("Error checking notification permission: $e");
      if (mounted) {
        setState(() {
          isNotificationEnabled = false;
        });
      }
    }
  }

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentDetailsView()),
                );
              },
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
              isNotification: true,
              notificationStatus: isNotificationEnabled,
              icon: Icons.notifications_outlined,
              title: AppLocalizations.of(context)!.notifications,
              onTap: () {
                buildShowNotificationDialog(context);
              },
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
