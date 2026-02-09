import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/account/presentation/manager/language_cubit/dark_and_light_mode_cubit.dart';

import 'package:wesal/features/account/presentation/manager/language_cubit/language_cubit.dart';
import 'package:wesal/features/main/presentation/main_view.dart';
import 'package:wesal/features/search/persentation/views/search_view.dart';
import 'package:wesal/l10n/app_localizations.dart';

class WesalApp extends StatelessWidget {
  const WesalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => DarkAndLightModeCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392, 847),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<LanguageCubit, Locale?>(
            builder: (context, locale) {
              return BlocBuilder<DarkAndLightModeCubit, ThemeMode>(
                builder: (BuildContext context, ThemeMode themeMode) {
                  return MaterialApp(
                    locale: locale,
                    themeAnimationDuration: const Duration(milliseconds: 100),
                    themeAnimationCurve: Curves.easeInOut,
                    routes: {SearchView.id: (context) => SearchView()},
                    debugShowCheckedModeBanner: false,
                    title: 'Wesal',
                    theme: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: Colors.orange,
                      ),
                      useMaterial3: true,
                    ),
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: Colors.orange,
                        brightness: Brightness.dark,
                      ),
                      useMaterial3: true,
                    ),
                    themeMode: themeMode,
                    // Localization
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,

                    home: const MainView(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
