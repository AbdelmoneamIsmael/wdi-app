import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';

class FlashView extends StatelessWidget {
  const FlashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 57.h,
            color: const Color(0xffF97415),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '⚡ Flash Deals',
                  style: AppTextStyles.extraBold(
                    context,
                  ).copyWith(color: Colors.white, fontSize: 28.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: const Color(0xffF97415).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: const Color(0xffF97415).withValues(alpha: 0.2),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Icon(
                  Icons.access_time,
                  color: const Color(0xffF97415),
                  size: 20.sp,
                ),
                Text(
                  'Ends in :',
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 16.sp, color: const Color(0xffF97415)),
                ),
                Container(
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffF97415),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '23',
                    style: AppTextStyles.bold(context).copyWith(
                      fontSize: 17.sp,
                      color: Colors.white,
                      height: getTextHeight(17, 28),
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 16.sp, color: const Color(0xffF97415)),
                ),
                Container(
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffF97415),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '59',
                    style: AppTextStyles.bold(context).copyWith(
                      fontSize: 17.sp,
                      color: Colors.white,
                      height: getTextHeight(17, 28),
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 16.sp, color: const Color(0xffF97415)),
                ),
                Container(
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffF97415),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '59',
                    style: AppTextStyles.bold(context).copyWith(
                      fontSize: 17.sp,
                      color: Colors.white,
                      height: getTextHeight(17, 28),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
