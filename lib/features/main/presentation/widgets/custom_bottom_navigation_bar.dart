import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/features/main/presentation/manager/index_value_notifier.dart';
import 'package:wesal/l10n/app_localizations.dart';

class CustomBottomNavgationBar extends StatelessWidget {
  const CustomBottomNavgationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: IndexValueNotifier.indexValueNotifier,
      builder: (context, index, child) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (currentIndex) {
            IndexValueNotifier.setIndex(currentIndex);
          },
          type: BottomNavigationBarType.fixed, // Ensure items don't shift
          unselectedItemColor: AppColor.bottomNavigationBarInActiveColr,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
          unselectedIconTheme: IconThemeData(
            color: AppColor.bottomNavigationBarInActiveColr,
          ),
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedFontSize: 12,
          selectedFontSize: 12,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.homeTitle,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.ordersTitle,
              icon: Icon(Icons.receipt_long),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.cartTitle,
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.accountTitle,
              icon: Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
