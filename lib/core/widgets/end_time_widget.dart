import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';

class EndsInWidget extends StatelessWidget {
  const EndsInWidget({required this.time, super.key});
  final Duration time;
  @override
  Widget build(BuildContext context) {
    final hours = getHours(time);
    final minutes = getMinutes(time);
    final seconds = getSeconds(time);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: const Color(0xffF97415).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xffF97415).withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
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
                hours,
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
                minutes,
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
                seconds,
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
    );
  }

  // function to get hours, minutes, seconds like this  5186 seconds to  01:26:26
  String getHours(Duration time) {
    final totalSeconds = time.inSeconds;
    final hours = totalSeconds ~/ 3600;

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return twoDigits(hours);
  }

  String getMinutes(Duration time) {
    final totalSeconds = time.inSeconds;
    final minutes = (totalSeconds % 3600) ~/ 60;
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    return twoDigits(minutes);
  }

  String getSeconds(Duration time) {
    final totalSeconds = time.inSeconds;
    final seconds = totalSeconds % 60;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return twoDigits(seconds);
  }
}
