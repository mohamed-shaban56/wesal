import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';

class PaymentMethodItem extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primaryColor.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : AppColor.lightGrey,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20.r),

                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: isSelected
                    ? AppTextStyle.cairo14BoldPrimary(context)
                    : AppTextStyle.cairo14Bold(context).copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColor.primaryColor, size: 24.r)
            else
              Icon(
                Icons.radio_button_unchecked,
                color: AppColor.lightGrey,
                size: 24.r,
              ),
          ],
        ),
      ),
    );
  }
}
