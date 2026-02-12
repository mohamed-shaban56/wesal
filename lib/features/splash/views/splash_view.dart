import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wesal/features/main/presentation/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Remove the native splash screen immediately when this view is built
    FlutterNativeSplash.remove();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Setting background to white to avoid black screen
      body: Center(
        child: Image.asset(
          'assets/images/app_logo.png', // Fallback or use app logo if available
          width: 200,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.fastfood, size: 100, color: Colors.orange),
        ),
      ),
    );
  }
}
