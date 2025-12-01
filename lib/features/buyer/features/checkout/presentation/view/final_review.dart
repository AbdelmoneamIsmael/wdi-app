import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/features/buyer/features/cart/presentation/pages/cart_screen.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/summary_product.dart';

class FinalReview extends StatelessWidget {
  const FinalReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrderSummaryWidget(
          footerText:
              'By placing this order, you agree to our Terms & Conditions',
          headerWidget: Column(
            spacing: 12,
            children: [
              SummaryProduct(
                imageUrl:
                    'https://m.media-amazon.com/images/I/51fJJkkrhRL._AC_SY879_.jpg',
              ),
              SummaryProduct(
                imageUrl: 'https://m.media-amazon.com/images/I/61js-G6ERKL.jpg',
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              'Order Notes (Optional)'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 16.sp, height: 24 / 16),
              ),
              const SizedBox(height: 12),

              const AppTextField(
                fillColor: Color(0xffFAFAFA),
                hint: 'Special delivery instructions...',
                maxLines: 5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(onPressed: () {}, child: 'Place Order'.toText()),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
          child: 'Back'.toText(),
        ),

        const SizedBox(height: 100),
      ],
    );
  }
}
