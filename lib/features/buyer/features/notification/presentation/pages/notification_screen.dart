import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/core/widgets/primary_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => const NotificationItem(),
            itemCount: 10,
          ).sliverPaddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      withShadow: true,
      padding: .all(8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedImage(
            url:
                'https://images-cdn.ubuy.lt/68d3f14ef2ddd165060978f6-apple-airpods-2nd-generation-with.jpg',
            height: 50.w,
            width: 50.w,
            radius: 12.r,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Your order #1234 has been shipped',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semiBold(
                    context,
                  ).copyWith(fontSize: 12.sp),
                ),
                const SizedBox(height: 4),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 0,
                      right: 0,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Text(
                    ' View Order →',
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 12.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          '10 min ago'.toText(
            style: AppTextStyles.regular(
              context,
            ).copyWith(fontSize: 12.sp, color: LightColors.text2Color),
          ),
        ],
      ),
    );
  }
}
