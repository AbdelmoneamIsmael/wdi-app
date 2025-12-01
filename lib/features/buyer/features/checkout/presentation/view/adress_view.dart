import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/features/buyer/features/cart/presentation/pages/cart_screen.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/delivary_section.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/summary_product.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DeliveryAddressSection(),
        const SizedBox(height: 14),
        BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                context.read<CheckoutCubit>().setCurrentStep(
                  context.read<CheckoutCubit>().currentStep + 1,
                );
              },
              child: 'Continue'.toText(),
            );
          },
        ),
        const SizedBox(height: 14),

        // Order Summary
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
