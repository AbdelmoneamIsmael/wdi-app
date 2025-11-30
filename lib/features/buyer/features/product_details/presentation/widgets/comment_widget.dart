import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/gen/assets.gen.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedImage(
              radius: 25.r,
              height: 50.w,
              width: 50.w,
              url:
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: AppTextStyles.regular(
                    context,
                  ).copyWith(fontSize: 14.sp),
                ),
                const SizedBox(height: 4),

                ///rating stars
                const GetStatrs(rating: 3),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: AppTextStyles.regular(context).copyWith(
            fontSize: 14.sp,
            height: 20 / 14,
            color: LightColors.text2Color,
          ),
        ),
      ],
    );
  }
}

class GetStatrs extends StatelessWidget {
  const GetStatrs({super.key, required this.rating});
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < rating; i++)
          SvgPicture.asset(
            Assets.icons.star,
            width: 16.w,
            height: 16.w,
            colorFilter: const ColorFilter.mode(
              Color(0xffFABF35),
              BlendMode.srcIn,
            ),
          ),
        for (int i = rating; i < 5; i++)
          SvgPicture.asset(
            Assets.icons.star,
            width: 16.w,
            height: 16.w,
            colorFilter: const ColorFilter.mode(
              Color(0xffF4F4F5),
              BlendMode.srcIn,
            ),
          ),
      ],
    );
  }
}
