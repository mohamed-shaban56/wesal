import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_image.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/features/payment/presentation/views/widgets/custom_payment_button.dart';
import 'package:wesal/features/payment/presentation/views/widgets/payment_method_item.dart';
import 'package:wesal/features/order/presentation/views/order_tracking_view.dart';
import 'package:wesal/l10n/app_localizations.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  int _selectedMethod = 0; // 0: Card, 1: Wallet, 2: Fawry

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.paymentDetails,
          style: AppTextStyle.cairo18Bold(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.selectPaymentMethod,
              style: AppTextStyle.cairo16Bold(
                context,
              ).copyWith(color: Colors.black87),
            ),
            SizedBox(height: 20.h),

            // Payment Methods
            PaymentMethodItem(
              title: AppLocalizations.of(context)!.creditCard,
              image: AppImages.visacartImage,
              isSelected: _selectedMethod == 0,
              onTap: () {
                setState(() {
                  _selectedMethod = 0;
                });
              },
            ),

            PaymentMethodItem(
              title: AppLocalizations.of(context)!.mobileWallet,
              image: AppImages.paymentWalletImage,
              isSelected: _selectedMethod == 1,
              onTap: () {
                setState(() {
                  _selectedMethod = 1;
                });
              },
            ),
            PaymentMethodItem(
              title: AppLocalizations.of(context)!.fawry,
              image: AppImages.fawryImage,
              isSelected: _selectedMethod == 2,
              onTap: () {
                setState(() {
                  _selectedMethod = 2;
                });
              },
            ),

            SizedBox(height: 40.h),

            // Order Summary (Example)
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.totalAmount,
                    style: AppTextStyle.cairo14(context),
                  ),
                  Text(
                    '1500 ${AppLocalizations.of(context)!.currency}',
                    style: AppTextStyle.cairo18Bold(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            CustomPaymentButton(
              text: AppLocalizations.of(context)!.pay,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderTrackingView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
