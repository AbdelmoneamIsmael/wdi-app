import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/product_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/flash_products_view.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/product_widget.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/pages/product_details.dart';
import 'package:wdi/gen/assets.gen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = ProductSampleData.generateSampleProducts();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CartAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: CustomScrollView(
          slivers: [
            Text(
              'Shopping Cart',
              style: AppTextStyles.bold(
                context,
              ).copyWith(fontSize: 18.sp, height: 1.5),
            ).toSliver().sliverPaddingOnly(top: 24),
            const SizedBox(height: 14).toSliver(),
            SliverList.separated(
              itemBuilder: (context, index) {
                return InfoContainerBanner(
                  title: 'TechStore Official',
                  icon: null,
                  leading: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: LightColors.lightPrimaryColor,
                    child: Text(
                      'T',
                      style: AppTextStyles.bold(context).copyWith(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: LightColors.primaryColor,
                      ),
                    ),
                  ),
                  child: const Column(
                    spacing: 27,
                    children: [
                      CartItemWidget(
                        imageUrl:
                            'https://m.media-amazon.com/images/I/51fJJkkrhRL._AC_SY879_.jpg',
                      ),
                      CartItemWidget(
                        imageUrl:
                            'https://m.media-amazon.com/images/I/61js-G6ERKL.jpg',
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemCount: 2,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {},
              child: const Text('Continue Shopping'),
            ).toSliver().sliverPaddingSymmetric(vertical: 20),
            const CouponWidget().toSliver(),
            const SizedBox(height: 20).toSliver(),
            const OrderSummaryWidget().toSliver(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Proceed to Checkout'),
            ).toSliver().sliverPaddingSymmetric(vertical: 20),
            SizedBox(height: (56 - 20).h).toSliver(),
            'You May Also Like'
                .toText(
                  style: AppTextStyles.bold(
                    context,
                  ).copyWith(fontSize: 22.7.sp, height: 32 / 22.7),
                )
                .toSliver(),
            const SizedBox(height: 24).toSliver(),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 171 / 400,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) =>
                  ProductWidget(product: productList[index]),
              itemCount: productList.length,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          'Order Summary'.toText(
            style: AppTextStyles.bold(
              context,
            ).copyWith(fontSize: 16.sp, height: 24 / 16),
          ),
          const SizedBox(height: 16),
          _buildOrderSummaryItem(
            context: context,
            title: 'Subtotal',
            value: 'AED 299.88',
          ),
          const SizedBox(height: 12),
          _buildOrderSummaryItem(
            context: context,
            title: 'Shipping',
            value: 'AED 10.00',
          ),
          const SizedBox(height: 12),
          _buildOrderSummaryItem(
            context: context,
            title: 'VAT (15%)',
            value: 'AED 44.98',
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            height: 32,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              'Total'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 17.sp, height: 24 / 17),
              ),
              const Expanded(child: SizedBox(width: 8)),
              'AED 344.86'.toText(
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 22.sp,
                  height: 32 / 22,
                  color: LightColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Text(
              'VAT included in total price',
              style: AppTextStyles.regular(context).copyWith(
                fontSize: 12.sp,
                height: 16 / 12,
                color: LightColors.text2Color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryItem({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        title.toText(
          style: AppTextStyles.regular(context).copyWith(
            fontSize: 14.sp,
            height: 20 / 14,
            color: LightColors.greyColor,
          ),
        ),
        const Expanded(child: SizedBox(width: 8)),
        value.toText(
          style: AppTextStyles.medium(
            context,
          ).copyWith(fontSize: 14.sp, height: 20 / 14),
        ),
      ],
    );
  }
}

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Icon(
                Icons.discount_outlined,
                size: 20.sp,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Have a coupon?',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.bold(
                    context,
                  ).copyWith(fontSize: 16.sp, height: 24 / 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Flexible(
                flex: 2,
                child: AppTextField(
                  hint: 'Enter coupon code',
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        CachedImage(
          radius: 12.r,
          url: imageUrl,
          height: 96.w,
          width: 96.w,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Premium Wireless Headphones',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 16.sp, height: 24 / 16),
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  Text(
                    'AED 299.88',
                    style: AppTextStyles.bold(context).copyWith(
                      fontSize: 18.sp,
                      height: 28 / 18,
                      color: LightColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        'AED 299.88',
                        style: AppTextStyles.regular(context).copyWith(
                          fontSize: 14.sp,
                          height: 20 / 14,
                          decoration: TextDecoration.lineThrough,
                          color: LightColors.text2Color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const QuantityWidget(withBorder: false),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Only 5 left ',
                        style: AppTextStyles.regular(context).copyWith(
                          fontSize: 14.sp,
                          height: 20 / 14,
                          color: LightColors.text2Color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              'AED 299.88'.toText(
                style: AppTextStyles.bold(
                  context,
                ).copyWith(fontSize: 16.sp, height: 24 / 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 20.sp,
                          color: LightColors.text2Color,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: FittedBox(
                            child: 'Save for later'.toText(
                              style: AppTextStyles.medium(
                                context,
                              ).copyWith(fontSize: 13.7.sp, height: 20 / 13.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 20.sp,
                          color: LightColors.redColor,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: FittedBox(
                            child: 'Remove'.toText(
                              style: AppTextStyles.medium(context).copyWith(
                                fontSize: 12.sp,
                                height: 20 / 12,
                                color: LightColors.redColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

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
