import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/product_entity.dart';
import 'package:wdi/gen/assets.gen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final orangeColor = isDark
        ? DarkColors.orangeColor
        : const Color(0xFFFF6B35);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkColors.backgroundColor : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with badges
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                // Product image
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: CachedImage(
                      url: product.imageUrl ?? '',

                      fit: BoxFit.scaleDown,
                      radius: 0,
                    ),
                  ),
                ),

                // Discount badge (top-left)
                if (product.hasDiscount && product.discountPercentage != null)
                  Positioned(
                    top: 12.h,
                    left: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        '${product.discountPercentage}% OFF',
                        style: AppTextStyles.semiBold(
                          context,
                        ).copyWith(color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                  ),
                // Favorite icon (top-right)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.4),
                      border: Border.all(color: LightColors.primaryColor),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product details section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product.name,
                    style: AppTextStyles.semiBold(
                      context,
                    ).copyWith(fontSize: 16.sp, height: 24 / 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  const Expanded(child: SizedBox()),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: orangeColor, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${product.rating}',
                        style: AppTextStyles.medium(
                          context,
                        ).copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${product.reviewCount})',
                        style: AppTextStyles.regular(context).copyWith(
                          fontSize: 12.sp,
                          color: isDark
                              ? DarkColors.text2Color
                              : LightColors.text2Color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        product.discountPrice.toStringAsFixed(2),
                        style: AppTextStyles.bold(context).copyWith(
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor,
                          height: 24 / 14,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Đ',
                        style: AppTextStyles.bold(context).copyWith(
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor,
                          height: 24 / 14,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        SizedBox(width: 8.w),
                        Text(
                          '${product.originalPrice.toStringAsFixed(2)} Đ',
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 10.sp,
                            height: 20 / 10,
                            color: isDark
                                ? DarkColors.text2Color
                                : LightColors.text2Color,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Add to Cart button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement add to cart functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.cart,
                            width: 20.w,
                            height: 20.h,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Add to Cart',
                            style: AppTextStyles.medium(context).copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
