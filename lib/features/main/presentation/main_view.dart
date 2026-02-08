import 'package:flutter/material.dart';
import 'package:wesal/features/main/presentation/manager/index_value_notifier.dart';
import 'package:wesal/features/main/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:wesal/features/main/presentation/widgets/functions/app_screens.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavgationBar(),
      body: ValueListenableBuilder<int>(
        valueListenable: IndexValueNotifier.indexValueNotifier,
        builder: (context, index, child) {
          return screen[index];
        },
      ),
    );
  }
}
