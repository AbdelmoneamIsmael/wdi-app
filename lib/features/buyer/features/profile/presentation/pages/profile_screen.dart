import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/routes/pages_keys.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const ProfileAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: CustomScrollView(
          slivers: [
            Text(
              'My Account',
              style: AppTextStyles.bold(
                context,
              ).copyWith(fontSize: 18.sp, height: 1.5),
            ).toSliver().sliverPaddingOnly(top: 24),
            const SizedBox(height: 22).toSliver(),
            //profile image
            PrimaryContainer(
              child: Column(
                children: [
                  SvgPicture.asset(Assets.icons.user),
                  const SizedBox(height: 16),
                  Text(
                    'Ahmed Al Mansoori',
                    style: AppTextStyles.semiBold(
                      context,
                    ).copyWith(fontSize: 20.sp, height: getTextHeight(20, 28)),
                  ),

                  Text(
                    'ahmed.almansoori@example.com',
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 14.sp,
                      height: getTextHeight(14, 20),
                      color: LightColors.text2Color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Member since January 2024',
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 12.sp,
                      height: getTextHeight(12, 16),
                      color: LightColors.text2Color,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8,
                    children: [
                      ProfileOptionWidget(
                        title: 'Personal Information',
                        icon: Assets.icons.profile,
                        onTap: () {
                          context.pushNamed(PagesKeys.personalInformation);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Addresses',
                        icon: Assets.icons.location,
                        onTap: () {
                          context.pushNamed(PagesKeys.addresses);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Payment Methods',
                        icon: Assets.icons.creditCard,
                        onTap: () {
                          context.pushNamed(PagesKeys.paymentMethods);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Coupons',
                        icon: Assets.icons.coupon,
                        onTap: () {
                          context.pushNamed(PagesKeys.coupons);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Wishlist',
                        icon: Assets.icons.favourit,
                        onTap: () {
                          context.pushNamed(PagesKeys.wishlist);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Loyalty Program ',
                        icon: Assets.icons.loyalty,
                        onTap: () {
                          context.pushNamed(PagesKeys.loyaltyProgram);
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Notifications',
                        icon: Assets.icons.notification,
                        onTap: () {
                          context.pushNamed(
                            PagesKeys.notificationsAndPreferance,
                          );
                        },
                      ),
                      ProfileOptionWidget(
                        title: 'Help & Support',
                        icon: Assets.icons.ask,
                        onTap: () {
                          context.pushNamed(PagesKeys.helpAndSupport);
                        },
                      ),
                      Divider(color: Theme.of(context).dividerColor, height: 1),
                      ProfileOptionWidget(
                        title: 'Logout',
                        icon: Assets.icons.logout,
                        onTap: () {
                          context.pushNamed(PagesKeys.signIn);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ).toSliver(),
          ],
        ),
      ),
    );
  }
}

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16).w,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16.w,
              height: 16.w,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 13),
            Text(
              title,
              style: AppTextStyles.medium(
                context,
              ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 32.w + 20.w,
      toolbarHeight: 70.h,
      title: Text(
        'WDI LOGO',
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
          Container(
            width: 32.w,
            height: 32.w,

            padding: EdgeInsets.all(4.r),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              Assets.icons.cart,

              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
