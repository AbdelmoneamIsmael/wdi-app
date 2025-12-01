import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/stepper_widget.dart';
import 'package:wdi/gen/assets.gen.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CheckoutAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: CustomScrollView(
          slivers: [
            'Checkout'
                .toText(
                  style: AppTextStyles.bold(
                    context,
                  ).copyWith(fontSize: 18.sp, height: 1.5),
                )
                .toSliver()
                .sliverPaddingOnly(top: 24),
            const SizedBox(height: 17).toSliver(),
            //steper widget
            const StepperWidget().toSliver(),
            BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, state) {
                return ExpandablePageView.builder(
                  controller: context.read<CheckoutCubit>().pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return context.read<CheckoutCubit>().steps[index];
                  },
                  itemCount: context.read<CheckoutCubit>().steps.length,
                );
              },
            ).toSliver(),

            // Delivery Address Section
          
          ],
        ),
      ),
    );
  }
}


class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 32.w + 20.w,
      toolbarHeight: 70.h,
      title: 'WDI LOGO'.toText(
        style: AppTextStyles.bold(context).copyWith(
          fontSize: 15.sp,
          color: Colors.white,
          height: getTextHeight(15, 28),
        ),
      ),
      actions: [
        Container(
          width: 32.w,
          height: 32.w,
          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: SvgPicture.asset(
            Assets.icons.menu2,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 20.w),
      ],
      leading: Row(
        children: [
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 32.w,
              height: 32.w,
              padding: EdgeInsets.all(4.r),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}



