import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/widget_widgets.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/gen/assets.gen.dart';


// ratting widget
class RattingWidget extends StatelessWidget {
  const RattingWidget({
    super.key,
    required this.rating,
    required this.reviewCount,
  });
  final int rating;
  final int reviewCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // rating stars and un mark stars
            Row(
              children: [
                for (int i = 0; i < rating; i++)
                  SvgPicture.asset(
                    Assets.icons.star,
                    width: 20.w,
                    height: 20.w,
                  ).toPaddingOnly(end: 4),
                for (int i = rating; i < 5; i++)
                  SvgPicture.asset(
                    Assets.icons.star,
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xffF4F4F5),
                      BlendMode.srcIn,
                    ),
                  ).toPaddingOnly(end: 4),
              ],
            ),
            const SizedBox(width: 16),
            Text(
              '$rating',
              style: AppTextStyles.medium(context).copyWith(fontSize: 14.sp),
            ),
            const SizedBox(width: 16),

            FittedBox(
              child: Text(
                '( $reviewCount reviews)',
                style: AppTextStyles.medium(context).copyWith(
                  fontSize: 13.sp,
                  color: LightColors.text2Color,
                  height: 20 / 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
