import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/pages/product_details.dart';
import 'package:wdi/gen/assets.gen.dart';

class LoyaltyProgramScreen extends StatelessWidget {
  const LoyaltyProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loyalty Program')),
      body: CustomScrollView(
        slivers: [
          Text(
            'Loyalty Program',
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
          ).toSliver().sliverPaddingOnly(top: 24, start: 16, end: 16),
          const SizedBox(height: 24).toSliver(),
          const LoayalDetailsWidget().toSliver().sliverPaddingOnly(
            start: 16,
            end: 16,
          ),
          const SizedBox(height: 24).toSliver(),
          const HowToEarnSection().toSliver().sliverPaddingOnly(
            start: 16,
            end: 16,
          ),
          const SizedBox(height: 24).toSliver(),
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.gift,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  LightColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              'Redeem Points'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 13.sp, height: getTextHeight(13, 20)),
              ),
            ],
          ).toSliver().sliverPaddingOnly(start: 16, end: 16),
          const SizedBox(height: 16).toSliver(),
          SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => const RedeemPointsWidget(),
            itemCount: 10,
          ).sliverPaddingOnly(start: 16, end: 16),
        ],
      ),
    );
  }
}

class RedeemPointsWidget extends StatelessWidget {
  const RedeemPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE4E4E7)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              'AED 50 Voucher'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 16.sp, height: getTextHeight(16, 24)),
              ),
              const Spacer(),
              SvgPicture.asset(
                Assets.icons.starGift,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  LightColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          'AED 50 off your next purchase'.toText(
            style: AppTextStyles.regular(context).copyWith(
              fontSize: 13.sp,
              height: getTextHeight(13, 20),
              color: LightColors.text2Color,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ).w,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F4F5),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  '20 Points',
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 12.sp, height: getTextHeight(12, 20)),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ).w,
                decoration: BoxDecoration(
                  color: LightColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: 'Redeem Now'.toText(
                  style: AppTextStyles.medium(context).copyWith(
                    fontSize: 12.sp,
                    height: getTextHeight(12, 20),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HowToEarnSection extends StatelessWidget {
  const HowToEarnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoContainerBanner(
      title: 'Rewards',
      icon: Assets.icons.static,
      child: Column(
        spacing: 16.h,
        children: [
          InfoContainerBannerOption(
            title: 'Shop & Earn',
            subtitle: 'Earn 1 point for every AED 1 spent',
            icon: null,
            leading: CircleAvatar(
              backgroundColor: LightColors.primaryColor.withValues(alpha: 0.1),
              child: '1'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 16),
                  color: LightColors.primaryColor,
                ),
              ),
            ),

            onTap: () {},
          ),
          InfoContainerBannerOption(
            onTap: () {},
            title: 'Write Reviews',
            subtitle: 'Earn 50 points for each review',
            icon: null,
            leading: CircleAvatar(
              backgroundColor: LightColors.primaryColor.withValues(alpha: 0.1),
              child: '2'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 16),
                  color: LightColors.primaryColor,
                ),
              ),
            ),
          ),
          InfoContainerBannerOption(
            onTap: () {},
            title: 'Refer a Friend',
            subtitle: 'Earn 100 points for each referral',
            icon: null,
            leading: CircleAvatar(
              backgroundColor: LightColors.primaryColor.withValues(alpha: 0.1),
              child: '3'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 16),
                  color: LightColors.primaryColor,
                ),
              ),
            ),
          ),
          InfoContainerBannerOption(
            onTap: () {},
            title: 'Birthday Bonus',
            subtitle: 'Earn 500 points on your birthday',
            icon: null,
            leading: CircleAvatar(
              backgroundColor: LightColors.primaryColor.withValues(alpha: 0.1),
              child: '4'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 16),
                  color: LightColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoayalDetailsWidget extends StatelessWidget {
  const LoayalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.47, -0.47),
          end: Alignment(0.53, 1.47),
          colors: [Color(0x197C3BED), Color(0x0C7C3BED)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE4E4E7)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.loyalty,
                            width: 24.w,
                            height: 24.w,
                            colorFilter: const ColorFilter.mode(
                              LightColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          'Gold Member'.toText(
                            style: AppTextStyles.bold(context).copyWith(
                              fontSize: 22.7.sp,
                              height: getTextHeight(22.7, 32),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    'Keep shopping to unlock more benefits'.toText(
                      style: AppTextStyles.regular(context).copyWith(
                        fontSize: 15.3.sp,
                        height: getTextHeight(15.3, 20),
                        color: LightColors.text2Color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  '2450'.toText(
                    style: AppTextStyles.bold(context).copyWith(
                      fontSize: 28.sp,
                      height: getTextHeight(28, 32),
                      color: LightColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  'Total Points'.toText(
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 13.6.sp,
                      height: getTextHeight(13.6, 20),
                      color: LightColors.text2Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              'Progress to Platinum'.toText(
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 13.8.sp, height: getTextHeight(13.8, 20)),
              ),
              const Expanded(child: SizedBox(width: 8)),
              '550 points to go'.toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: getTextHeight(13.7, 20),
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.5,
            color: LightColors.primaryColor,
            backgroundColor: LightColors.lightGreyColor,
            minHeight: 8,
            borderRadius: BorderRadius.circular(9999),
          ),
        ],
      ),
    );
  }
}
