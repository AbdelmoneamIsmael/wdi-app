import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/features/buyer/features/cart/presentation/pages/cart_screen.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/payement_info_widget.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/shipping_mission_widget.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/summary_product.dart';
import 'package:wdi/gen/assets.gen.dart';

class PayMentView extends StatelessWidget {
  const PayMentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                'Payment Method',
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 19.sp, height: 28 / 18),
              ),
              const SizedBox(),
              PayementInfoWidget(
                isSelected: true,
                title: 'Credit/Debit Card',
                description: 'Pay securely with your card',
                icon: Assets.icons.creditCard,
              ),
              PayementInfoWidget(
                isSelected: false,
                title: 'Apple Pay',
                description: 'Fast and secure payment with Apple Pay',
                icon: Assets.icons.applePay,
              ),
              PayementInfoWidget(
                isSelected: false,
                title: 'Buy Now, Pay Later',
                description: 'Split your payment with Tabby or Tamara',
                icon: Assets.icons.walet,
              ),
              PayementInfoWidget(
                isSelected: false,
                title: 'Cash on Delivery',
                description: 'Pay when you receive your order',
                icon: Assets.icons.cash,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                context.read<CheckoutCubit>().setCurrentStep(4);
              },
              child: 'Continue'.toText(),
            );
          },
        ),
        const SizedBox(height: 21),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
          ),
          onPressed: () {},
          child: 'Back'.toText(),
        ),
        const SizedBox(height: 32),
        const OrderSummaryWidget(
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
        const SizedBox(height: 20),

        SizedBox(height: (56 - 20).h),
      ],
    );
  }
}
