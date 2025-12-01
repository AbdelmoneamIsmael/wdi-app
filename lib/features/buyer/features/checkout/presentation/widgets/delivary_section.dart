import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/widgets/location_widget.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          'Delivery Address'.toText(
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 18.sp, height: 28 / 18),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle edit address
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              fixedSize: Size.fromHeight(48.h),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Icon(
                  Icons.add,
                  size: 16.sp,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                const SizedBox(width: 8),
                'Add New Address'.toText(
                  style: AppTextStyles.medium(
                    context,
                  ).copyWith(fontSize: 13.6.sp),
                ),
              ],
            ),
          ),
          const LocationWidget(isSelected: true),
          const LocationWidget(isSelected: false),
        ],
      ),
    );
  }
}
