import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Addresses')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Saved Addresses',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(48.h),
                textStyle: AppTextStyles.medium(context).copyWith(
                  fontSize: 14.sp,
                  height: getTextHeight(14, 20),
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 16.sp, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text('Add New Address'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CoreLocationWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoreLocationWidget extends StatelessWidget {
  const CoreLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text('Home', style: AppTextStyles.semiBold(context)),
                const SizedBox(),
                Text(
                  'Ahmed Al Mansoori',
                  style: AppTextStyles.medium(
                    context,
                  ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
                ),
                Text(
                  'Sheikh Zayed Road, Building 42',
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 13.7.sp,
                    height: getTextHeight(13.7, 20),
                    color: LightColors.text2Color,
                  ),
                ),
                'Phone Number'.toText(
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 13.7.sp,
                    height: getTextHeight(13.7, 20),
                    color: LightColors.text2Color,
                  ),
                ),
                '+971 50 123 4567'.toText(
                  style: AppTextStyles.regular(context).copyWith(
                    fontSize: 13.7.sp,
                    height: getTextHeight(13.7, 20),
                    color: LightColors.text2Color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Icon(Icons.edit, size: 16.sp),
          const SizedBox(width: 16),
          Icon(Icons.delete, size: 16.sp, color: LightColors.redColor),
        ],
      ),
    );
  }
}
