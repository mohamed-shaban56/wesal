import 'package:flutter/material.dart';
import 'package:wesal/features/account/presentation/widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const AccountViewBody()));
  }
}
