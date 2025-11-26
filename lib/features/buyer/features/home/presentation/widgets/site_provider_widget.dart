import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/site_provider_entity.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';

class SiteProviderCard extends StatelessWidget {
  const SiteProviderCard({super.key, required this.siteProvider});
  final SiteProviderEntity siteProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 6, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffFFF5EE),

        border: Border.all(color: const Color(0xffE5E5E5), width: .92.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                siteProvider.icon,
                width: 32.w,
                height: 32.h,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 14),
              Text(
                siteProvider.title,
                style: AppTextStyles.medium(context).copyWith(
                  fontSize: 14.56.sp,
                  height: getTextHeight(14.56, 20.2),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    siteProvider.description,
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff5F5D5D),
                      height: getTextHeight(12, 14.4),
                    ),
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
