import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/gen/assets.gen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Payment Methods',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(48.h),
                textStyle: AppTextStyles.medium(context).copyWith(
                  fontSize: 14.sp,
                  height: getTextHeight(14, 20),
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 16.sp, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text('Add New Card'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CorePaymentMethodWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CorePaymentMethodWidget extends StatelessWidget {
  const CorePaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            padding: const EdgeInsets.all(12).w,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F5),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.icons.creditCard,
                width: 16.w,
                height: 16.h,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  'visa',
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
                ),
                const SizedBox(),
                '•••• •••• •••• 4242 Expires 12/25'.toText(
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 12.sp,
                    height: getTextHeight(12, 20),
                    color: LightColors.text2Color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12).w,
              child: SvgPicture.asset(
                Assets.icons.edit,
                width: 16.w,
                height: 16.h,
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12).w,
              child: SvgPicture.asset(
                Assets.icons.delete,
                width: 16.w,
                height: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
