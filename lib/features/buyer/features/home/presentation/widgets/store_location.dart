import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/gen/assets.gen.dart';

class StoreLocation extends StatelessWidget {
  const StoreLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
        decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
        height: 51.h,
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.location),
            const SizedBox(width: 12),
            const VerticalDivider(
              color: LightColors.primaryColor,
              thickness: 1,
              width: 1,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Sheikh Zayed Road, Building 42, Dubai',
                  style: AppTextStyles.medium(
                    context,
                  ).copyWith(fontSize: 15.sp, height: getTextHeight(15, 20)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
