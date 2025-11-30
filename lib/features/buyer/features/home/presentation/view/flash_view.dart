import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/end_time_widget.dart';

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
          EndsInWidget(
            time: DateTime.now().difference(
              DateTime.now().add(
                const Duration(hours: 23, minutes: 59, seconds: 59),
              ),
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

