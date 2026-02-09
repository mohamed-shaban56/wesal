import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkAndLightModeCubit extends Cubit<ThemeMode> {
  DarkAndLightModeCubit() : super(ThemeMode.light);
  void changethemMode(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
