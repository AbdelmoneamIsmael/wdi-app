import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'My Coupons',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12).w,
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F5),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                '3 Available',
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 12.sp, height: getTextHeight(12, 20)),
              ),
            ),
            const SizedBox(height: 32),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CouponWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.6).w,
                decoration: BoxDecoration(
                  color: const Color(0xff7C3BED).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '20% OFF',
                  style: AppTextStyles.bold(context).copyWith(
                    fontSize: 14.sp,
                    height: getTextHeight(14, 20),
                    color: const Color(0xff7C3BED),
                  ),
                ),
              ),
              const Expanded(child: SizedBox(width: 10)),
              Icon(
                Icons.calendar_month_outlined,
                size: 16.sp,
                color: LightColors.text2Color,
              ),
              const SizedBox(width: 4),
              'Valid until 31/12/2025'.toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 20),
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ),
          const SizedBox(),
          const SizedBox(),
          '20% off on orders above AED 200'.toText(
            style: AppTextStyles.medium(
              context,
            ).copyWith(fontSize: 16.sp, height: getTextHeight(16, 24)),
          ),
          const SizedBox(),
          'Valid on all categories. Cannot be combined with other offers. '
              .toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 20),
                  color: LightColors.text2Color,
                ),
              ),
          const SizedBox(),
          const SizedBox(),
          Container(
            padding: const EdgeInsets.all(12).w,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F5),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'SAVE20'.toText(
                  style: AppTextStyles.bold(context).copyWith(
                    fontSize: 14.5.sp,
                    height: getTextHeight(14.5, 20),
                  ),
                ),
                Icon(
                  Icons.copy,
                  size: 16.sp,
                  color: LightColors.textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
