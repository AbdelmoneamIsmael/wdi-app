import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, this.isSelected = false});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffFFEFE4) : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 16.sp,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : LightColors.greyColor,
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Home'.toText(
                      style: AppTextStyles.semiBold(
                        context,
                      ).copyWith(fontSize: 14.sp, height: 24 / 16),
                    ),
                    const SizedBox(),
                    'John Doe'.toText(
                      style: AppTextStyles.medium(
                        context,
                      ).copyWith(fontSize: 13.6.sp, height: 24 / 16),
                    ),
                    '+971 50 123 4567'.toText(
                      style: AppTextStyles.medium(context).copyWith(
                        fontSize: 14.sp,
                        height: 20 / 14,
                        color: LightColors.greyColor,
                      ),
                    ),
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.location,
                          width: 13.sp,
                          height: 16.sp,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(
                            LightColors.greyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        Expanded(
                          child: '30 Main Street, Build B2Dubai, Burj Khalifa'
                              .toText(
                                style: AppTextStyles.medium(context).copyWith(
                                  color: LightColors.greyColor,
                                  fontSize: 13.6.sp,
                                  height: 20 / 13,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
