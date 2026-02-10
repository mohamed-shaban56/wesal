import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesal/features/account/presentation/manager/language_cubit/dark_and_light_mode_cubit.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  late bool _isDark;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final themeMode = context.read<DarkAndLightModeCubit>().state;
    _isDark = themeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isDark,
      onChanged: (val) async {
        setState(() {
          _isDark = val;
        });

        await Future.delayed(const Duration(milliseconds: 200));
        if (mounted) {
          context.read<DarkAndLightModeCubit>().changethemMode(val);
        }
      },
      activeThumbColor: AppColor.primaryColor,
    );
  }
}
