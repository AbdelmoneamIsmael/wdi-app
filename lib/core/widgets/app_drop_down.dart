import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.initialValue,
    required this.onChanged,
    this.hint,
    this.value,
    this.label,
    this.helper,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.fillColor,
    this.isExpanded = false,
  });
  final String title;
  final List<DropdownMenuItem> items;
  final String initialValue;
  final void Function(String?)? onChanged;
  final String? hint;
  final String? value;
  final String? label;
  final String? helper;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;
  final Color? fillColor;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.medium(
            context,
          ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
        ),
        DropdownButtonFormField(
          style: AppTextStyles.regular(
            context,
          ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
          initialValue: initialValue,

          decoration: InputDecoration(
            hintStyle: AppTextStyles.regular(context).copyWith(
              fontSize: 14.sp,
              height: getTextHeight(14, 20),
              color: LightColors.text2Color,
            ),
            fillColor: fillColor ?? const Color(0xffFAFAFA),
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          items: items,
          onChanged: (value) => onChanged!(value as String?),
        ),
      ],
    );
  }
}
