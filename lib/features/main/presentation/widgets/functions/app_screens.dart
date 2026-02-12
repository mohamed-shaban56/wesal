import 'package:flutter/material.dart';
import 'package:wesal/features/account/presentation/views/account_view.dart';
import 'package:wesal/features/cart/presentation/views/cart_view.dart';
import 'package:wesal/features/home/presentation/views/home_view.dart';
import 'package:wesal/features/order/presentation/views/order_tracking_view.dart';

List<Widget> screen = [
  HomeView(),
  OrderTrackingView(),
  CartView(),
  AccountView(),
];
