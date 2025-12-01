  
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/cashed_images.dart';

class SummaryProduct extends StatelessWidget {
  const SummaryProduct({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedImage(
          url: imageUrl,
          height: 60.w,
          width: 60.w,
          radius: 4.r,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Premium Wireless Headphones'.toText(
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 14.sp, height: 20 / 14),
              ),
              'Qty: 1'.toText(
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 14.sp,
                  height: 20 / 14,
                  color: LightColors.greyColor,
                ),
              ),
              'AED 299.88'.toText(
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 14.sp, height: 20 / 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
