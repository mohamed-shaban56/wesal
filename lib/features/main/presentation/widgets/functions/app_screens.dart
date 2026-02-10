import 'package:flutter/material.dart';
import 'package:wesal/features/account/presentation/views/account_view.dart';
import 'package:wesal/features/home/presentation/views/home_view.dart';

List<Widget> screen = [
  HomeView(),
  Container(height: double.infinity, width: double.infinity, color: Colors.red),
  Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.green,
  ),
  AccountView(),
];
