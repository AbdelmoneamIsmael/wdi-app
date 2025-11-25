import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String icon;
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(8.w),
        duration: const Duration(milliseconds: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? LightColors.selectedColor
              : Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(
                        context,
                      ).bottomNavigationBarTheme.selectedItemColor!
                    : Theme.of(
                        context,
                      ).bottomNavigationBarTheme.unselectedItemColor!,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title.tr(),
                style: AppTextStyles.regular(context).copyWith(
                  color: isSelected
                      ? Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor
                      : Theme.of(
                          context,
                        ).bottomNavigationBarTheme.unselectedItemColor!,
                  fontSize: 12.sp,
                  height: getTextHeight(12, 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
