import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/extension/widget_widgets.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/core/widgets/end_time_widget.dart';
import 'package:wdi/core/widgets/info_widget.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/flash_products_view.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/widgets/comment_widget.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/widgets/ratting_widget.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/widgets/review_persentage.dart';
import 'package:wdi/gen/assets.gen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://m.media-amazon.com/images/I/41IUObRgxkL.jpg',
      'https://futureaudiophile.com/wp-content/uploads/2022/11/3-Headphones-Side-1024x683.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW0-U-Lgd9qZg7NF07UseHC0_Z4iPGPt-Kqw&s',
      'https://imgix.bustle.com/uploads/image/2022/3/4/d74f5bcf-d194-4458-ad6b-263af28d076e-mw65s3_45_hero_1_1600x.jpg?w=414&h=478&fit=crop&crop=faces&blend=000000&blendAlpha=45&blendMode=normal&dpr=2',
    ];
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          AspectRatio(
            aspectRatio: 344 / 460,
            child: CachedImage(
              fit: BoxFit.cover,
              radius: 12.r,
              url: 'https://m.media-amazon.com/images/I/41IUObRgxkL.jpg',
            ),
          ).toSliver().sliverPaddingAll(all: 16.w),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 81.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) => AspectRatio(
                  aspectRatio: 81 / 81,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      CachedImage(
                        url: images[index],
                        fit: BoxFit.cover,
                        radius: 12.r,
                        isBlur: index == images.length - 1,
                      ),
                      index == images.length - 1
                          ? Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 32.sp,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemCount: images.length,
              ),
            ),
          ),
          const SizedBox(height: 32).toSliver(),
          Text(
            'Wireless Bluetooth Headphones with ActiveNoise Cancelling',
            style: AppTextStyles.bold(
              context,
            ).copyWith(fontSize: 28.5.sp, height: 36 / 28.5),
          ).toSliver().sliverPaddingSymmetric(horizontal: 16),
          12.verticalSpace.toSliver(),
          const RattingWidget(
            rating: 4,
            reviewCount: 1000,
          ).toSliver().sliverPaddingSymmetric(horizontal: 16),
          const SizedBox(height: 20).toSliver(),
          Row(
            children: [
              '79.00 Đ'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 35.sp,
                  height: 28 / 35,
                  color: LightColors.primaryColor,
                ),
              ),
              const SizedBox(width: 8),
              '129.00 Đ'.toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 14.sp,
                  height: 20 / 14,
                  color: LightColors.text2Color,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ).toSliver().sliverPaddingSymmetric(horizontal: 16.w),
          'Price includes VAT'
              .toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 14.sp,
                  height: 20 / 14,
                  color: LightColors.text2Color,
                ),
              )
              .toSliver()
              .sliverPaddingOnly(bottom: 16, top: 20, start: 16, end: 16),
          const EndsInWidget(
            time: Duration(hours: 22, minutes: 43, seconds: 59),
          ).toSliver().sliverPaddingOnly(bottom: 24, start: 16, end: 16),
          Divider(
            color: Theme.of(context).dividerColor,
            height: 1,
          ).toSliver().sliverPaddingOnly(bottom: 24, start: 16, end: 16),
          '- Arrives within 4 business days or more\n- sold | Sold by seller: “store name”'
              .toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 15.sp, height: 24 / 15),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16),
          'In Stock - Ready to Ship'
              .toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 15.sp, height: 24 / 15),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, top: 24, bottom: 26),
          Row(
            children: [
              'Color:'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 15.sp, height: 24 / 15),
              ),
              const SizedBox(width: 8),
              'Midnight Black'.toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 15,
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ).toSliver().sliverPaddingOnly(start: 16, end: 16, bottom: 12),
          const ProductColorsListView().toSliver(),
          Divider(color: Theme.of(context).dividerColor, height: 1)
              .toSliver()
              .sliverPaddingOnly(bottom: 24, start: 16, end: 16, top: 24),
          'Quantity:'
              .toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 15.sp, height: 24 / 15),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 0, top: 10),
          const QuantityWidget().toSliver(),
          Column(
            spacing: 16.h,
            children: [
              Row(
                spacing: 12.w,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.cart,
                            width: 16.w,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: FittedBox(child: Text('add_to_cart'.tr())),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BorderButton(
                    child: SvgPicture.asset(
                      Assets.icons.favourit,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  BorderButton(
                    child: SvgPicture.asset(
                      Assets.icons.share,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text('buy_now'.tr()),
              ),
            ],
          ).toSliver().sliverPaddingAll(all: 20),
          Divider(color: Theme.of(context).dividerColor, height: 16).toSliver(),
          16.verticalSpace.toSliver(),
          SizedBox(
            height: 70.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemBuilder: (context, index) => Container(
                width: 100.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).shadowColor.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(child: SvgPicture.asset(Assets.icons.tamaraLogo)),
              ),
              itemCount: 2,
            ),
          ).toSliver(),

          'Pay later with Tabby or Tamara'
              .toText(
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 12.sp, height: 19 / 12),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, top: 8, bottom: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Starting from ',
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 10.sp,
                    height: 15 / 10,
                    color: LightColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: '79.00 Đ',
                  style: AppTextStyles.bold(context).copyWith(
                    fontSize: 11.sp,
                    height: 17 / 11,
                    color: LightColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' /month with easy installments.',
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 10.sp,
                    height: 15 / 10,
                    color: LightColors.primaryColor,
                  ),
                ),
              ],
            ),
          ).toSliver().sliverPaddingOnly(start: 16, end: 16, bottom: 8),
          InfoContainerBanner(
            title: 'Shipping & Returns',
            icon: Assets.icons.shipping,
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16.h,
              children: [
                InfoContainerBannerOption(
                  title: 'Estimated Delivery',
                  subtitle: '2-3 business days',
                  icon: Assets.icons.locationMark,
                  onTap: () {},
                ),
                InfoContainerBannerOption(
                  title: 'Shipping Fee',
                  subtitle: 'Free shipping on orders over 1000 AED',
                  icon: Assets.icons.shipping,
                  onTap: () {},
                ),
                InfoContainerBannerOption(
                  title: '14-Day Returns',
                  subtitle: 'Return within 14 days for full refund',
                  icon: Assets.icons.returnIcon,
                  onTap: () {},
                ),
                InfoContainerBannerOption(
                  title: 'Warranty Included',
                  subtitle: '2-year manufacturer warranty',
                  icon: Assets.icons.warnty,
                  onTap: () {},
                ),
              ],
            ),
          ).toSliver().sliverPaddingOnly(
            start: 16,
            end: 1,
            top: 25,
            bottom: 25,
          ),
          InfoContainerBanner(
            title: 'Seller Information',
            icon: Assets.icons.market,
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  spacing: 12.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 64.w,
                      width: 64.w,
                      padding: const EdgeInsets.all(16).w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.market,
                        width: 32.w,
                        height: 32.w,
                        colorFilter: const ColorFilter.mode(
                          LightColors.text2Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Premium Audio Store',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.semiBold(
                              context,
                            ).copyWith(fontSize: 15.6.sp, height: 24 / 15.6),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.icons.star),
                              const SizedBox(width: 4),
                              Text(
                                '4.9',
                                style: AppTextStyles.regular(context).copyWith(
                                  fontSize: 13.7.sp,
                                  height: 24 / 13.7,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  '1,543 Products',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.regular(context)
                                      .copyWith(
                                        fontSize: 13.sp,
                                        height: 24 / 13.7,

                                        color: LightColors.text2Color,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              'Response Rate:'.toText(
                                style: AppTextStyles.regular(context).copyWith(
                                  fontSize: 13.7.sp,
                                  height: 20 / 13.7,
                                  color: LightColors.text2Color,
                                ),
                              ),
                              Text(
                                ' 98%',
                                style: AppTextStyles.semiBold(context).copyWith(
                                  fontSize: 13.7.sp,
                                  height: 20 / 13.7,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.market),
                            const SizedBox(width: 16),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'View Store',
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 13.7.sp,
                                    height: 20 / 13.7,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BorderButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.chat),
                            const SizedBox(width: 16),
                            Text(
                              'chat',
                              style: AppTextStyles.medium(
                                context,
                              ).copyWith(fontSize: 13.7.sp, height: 20 / 13.7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).toSliver().sliverPaddingOnly(start: 16, end: 16, bottom: 70),

          'Product Description'
              .toText(
                style: AppTextStyles.bold(
                  context,
                ).copyWith(fontSize: 22.sp, height: 32 / 22),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 19),
          r'''Experience premium sound quality with our latest
  wireless headphones. Featuring advanced active
  noise cancelling technology, 30-hour battery life,
  and premium comfort padding for all-day wear.
  Perfect for music lovers, frequent travelers, and
  professionals who demand the best audio
  experience.'''
              .toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 14.sp,
                  height: 26 / 14,
                  color: LightColors.text2Color,
                ),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 28),
          "What's in the Box"
              .toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 15.6.sp, height: 24 / 15.6),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            spacing: 8.h,
            children: [
              Text(
                '1x Wireless Headphones',
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 13.7,
                  color: LightColors.text2Color,
                ),
              ),
              Text(
                '1x Charging Case',
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 13.7,
                  color: LightColors.text2Color,
                ),
              ),
              Text(
                '1x USB-C Cable',
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 13.7,
                  color: LightColors.text2Color,
                ),
              ),
              Text(
                '1x User Guide',
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 13.7,
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ).toSliver().sliverPaddingOnly(start: 16, end: 16),
          70.verticalSpace.toSliver(),
          'Reviews'
              .toText(
                style: AppTextStyles.bold(
                  context,
                ).copyWith(fontSize: 22.sp, height: 32 / 22),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 24),
          'Average rating'
              .toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 18.sp,
                  height: 32 / 18,
                  color: LightColors.text2Color,
                ),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 19),
          16.verticalSpace.toSliver(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '4.9',
                style: AppTextStyles.regular(
                  context,
                ).copyWith(fontSize: 48.sp, height: 64 / 48),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    SvgPicture.asset(
                      Assets.icons.star,
                      width: 32.w,
                      height: 32.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffFABF35),
                        BlendMode.srcIn,
                      ),
                    ).toPaddingOnly(end: 4),
                  for (int i = 5; i < 5; i++)
                    SvgPicture.asset(
                      Assets.icons.star,
                      width: 32.w,
                      height: 32.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffF4F4F5),
                        BlendMode.srcIn,
                      ),
                    ).toPaddingOnly(end: 4),
                ],
              ),
            ],
          ).toSliver().sliverPaddingOnly(start: 16, end: 16, bottom: 28),
          const ReviewPersentage().toSliver().sliverPaddingOnly(
            start: 16,
            end: 16,
            bottom: 24,
          ),
          'Comments'
              .toText(
                style: AppTextStyles.regular(
                  context,
                ).copyWith(fontSize: 18.sp, height: 32 / 18),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 24),
          SliverList.separated(
            itemBuilder: (context, index) => const CommentWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 5,
          ).sliverPaddingOnly(start: 16, end: 16, bottom: 24),
          'Leave a comment'
              .toText(
                style: AppTextStyles.regular(
                  context,
                ).copyWith(fontSize: 14.sp, height: 20 / 14),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 24, top: 20),
          AppTextField(
            //send icon
            suffixIcon: SvgPicture.asset(
              Assets.icons.chat,
              width: 20.w,
              height: 20.h,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                LightColors.text2Color,
                BlendMode.srcIn,
              ),
            ),
            hint: 'Write your comment here',
          ).toSliver().sliverPaddingOnly(start: 16, end: 16, bottom: 24),
          74.verticalSpace.toSliver(),
          'You May Also Like'
              .toText(
                style: AppTextStyles.bold(
                  context,
                ).copyWith(fontSize: 22.sp, height: 32 / 22),
              )
              .toSliver()
              .sliverPaddingOnly(start: 16, end: 16, bottom: 24),
          const FlashProductsView(),
          ///////
          const SizedBox(height: 40).toSliver(),
        ],
      ),
    );
  }
}

class InfoContainerBannerOption extends StatelessWidget {
  const InfoContainerBannerOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.leading,
  });
  final String title;
  final String subtitle;
  final String? icon;
  final Widget? leading;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading ??
            SvgPicture.asset(
              icon ?? '',
              width: 20.w,
              height: 20.h,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                LightColors.text2Color,
                BlendMode.srcIn,
              ),
            ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 15.sp, height: 24 / 15),
              ),
              Text(
                subtitle,
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 13.7.sp,
                  height: 24 / 15,
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: child,
    );
  }
}

class InfoContainerBanner extends StatelessWidget {
  const InfoContainerBanner({
    super.key,
    required this.child,
    required this.title,
    required this.icon,
    this.leading,
    this.onTap,
  });
  final Widget child;
  final String title;
  final String? icon;
  final Widget? leading;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                leading ??
                    SvgPicture.asset(
                      icon ?? '',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(
                        LightColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                const SizedBox(width: 8),
                Expanded(
                  child: title.toText(
                    style: AppTextStyles.semiBold(
                      context,
                    ).copyWith(fontSize: 17.4.sp, height: 28.1 / 17.4),
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              height: 32,
              thickness: 1,
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key, this.withBorder = true});
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.w,
          children: [
            Icon(
              Icons.remove,
              size: 20.sp,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ).toPaddingOnly(start: 10),
            withBorder
                ? VerticalDivider(
                    color: Theme.of(context).dividerColor,
                    thickness: 1,
                    width: 1,
                  )
                : const SizedBox.shrink(),
            Text(
              '1',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 16.sp, height: 24 / 15),
            ).toPaddingHorizontal(horizontal: 8.w),
            withBorder
                ? VerticalDivider(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                    thickness: 1,
                  )
                : const SizedBox.shrink(),
            Icon(
              Icons.add,
              size: 20.sp,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ).toPaddingOnly(end: 10),
          ],
        ),
      ),
    );
  }
}

// product Colors ListView
class ProductColorsListView extends StatelessWidget {
  const ProductColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color(0xFF000000),
      const Color(0xFFFFFFFF),
      const Color(0xFFF44336),
      const Color(0xFFE91E63),
      const Color(0xFF9C27B0),
      const Color(0xFF673AB7),
      const Color(0xFF3F51B5),
      const Color(0xFF2196F3),
      const Color(0xFF03A9F4),
      const Color(0xFF00BCD4),
    ];
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: 1,
          child: ProductColorWidget(
            color: colors[index],
            isSelected: index == 0,
          ),
        ),
        itemCount: colors.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
      ),
    );
  }
}

class ProductColorWidget extends StatelessWidget {
  const ProductColorWidget({
    super.key,
    required this.color,
    this.isSelected = false,
  });
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: color,
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).dividerColor,
          width: 2,
        ),
      ),
    );
  }
}
