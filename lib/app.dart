import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wesal/features/main/presentation/main_view.dart';
import 'package:wesal/features/search/persentation/views/search_view.dart';
import 'package:wesal/l10n/app_localizations.dart';

class WesalApp extends StatelessWidget {
  const WesalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 847),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          routes: {SearchView.id: (context) => SearchView()},
          debugShowCheckedModeBanner: false,
          title: 'Wesal',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
          ),

          // Localization
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          home: const MainView(),
        );
      },
    );
  }
}
