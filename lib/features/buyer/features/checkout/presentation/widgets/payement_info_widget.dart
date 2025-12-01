import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';

class PayementInfoWidget extends StatelessWidget {
  const PayementInfoWidget({
    this.isSelected = false,
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });
  final bool isSelected;
  final String title;
  final String description;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 17,
        right: 12,
        top: 12,
        bottom: 12,
      ).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            size: 20.sp,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).dividerColor,
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(10).w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColorLight,
            ),
            child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 13.9.sp, height: 14 / 13.9),
                ),
                description.toText(
                  style: AppTextStyles.medium(context).copyWith(
                    fontSize: 13.7.sp,
                    height: 20 / 13.7,
                    color: LightColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
