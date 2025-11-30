import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';

class ReviewPersentage extends StatelessWidget {
  const ReviewPersentage({super.key});

  @override
  Widget build(BuildContext context) {
    // Rating distribution data: [rating, percentage]
    final List<MapEntry<int, double>> ratingData = [
      const MapEntry(5, 75.0),
      const MapEntry(4, 16.0),
      const MapEntry(3, 5.0),
      const MapEntry(2, 1.0),
      const MapEntry(1, 3.0),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ratingData.map((entry) {
        final rating = entry.key;
        final percentage = entry.value;
        return Padding(
          padding: EdgeInsets.only(bottom: rating == 1 ? 0 : 12.h),
          child: Row(
            children: [
              // Left label: "X use"
              SizedBox(
                width: 50.w,
                child: Text(
                  '$rating use',
                  style: AppTextStyles.regular(
                    context,
                  ).copyWith(fontSize: 13.sp),
                ),
              ),
              SizedBox(width: 12.w),
              // Progress bar
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    boxShadow: const [
                      // BoxShadow(
                      //   color: Colors.black.withValues(alpha: 0.3),
                      //   blurRadius: 4,
                      //   offset: const Offset(0, 2),
                      // ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Stack(
                      children: [
                        // Background (unfilled section - white)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: LightColors.greyColor,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        // Filled section (dark grey/purple)
                        FractionallySizedBox(
                          widthFactor: percentage / 100,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black, // Dark grey/purple color
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Right percentage
              SizedBox(
                width: 50.w,
                child: Text(
                  '${percentage.toInt()}%',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.regular(
                    context,
                  ).copyWith(fontSize: 13.sp),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
