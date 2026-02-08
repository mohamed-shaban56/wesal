import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/features/main/presentation/manager/index_value_notifier.dart';

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
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(Icons.receipt_long),
            ),
            BottomNavigationBarItem(label: 'Pay', icon: Icon(Icons.payment)),
            BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
