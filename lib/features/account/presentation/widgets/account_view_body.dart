import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/features/account/presentation/widgets/profile_header.dart';
import 'package:wesal/features/account/presentation/widgets/account_menu_list.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(height: 30.h),
          const AccountMenuList(),
        ],
      ),
    );
  }
}
