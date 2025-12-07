import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/widget_widgets.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/gen/assets.gen.dart';

class NotificationsAndPreferencesScreen extends StatelessWidget {
  const NotificationsAndPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications & Preferences')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          children: [
            Text(
              'Notifications & Preferences',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
            ),
            const SizedBox(height: 24),
            const PushNotificationSection(),
            const SizedBox(height: 24),
            const EmailPreferencesSection(),
            const SizedBox(height: 24),
            const LanguageSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Push Notifications',
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 17.3.sp, height: getTextHeight(17.3, 24)),
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
              ),
              DropdownButtonFormField(
                initialValue: 'en',
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Currency',
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
              ),
              DropdownButtonFormField(
                initialValue: 'aed',
                items: const [
                  DropdownMenuItem(value: 'aed', child: Text('AED (د.إ)')),
                  DropdownMenuItem(value: 'sar', child: Text('SAR (ر.س)')),
                  DropdownMenuItem(value: 'usd', child: Text('USD (\$)')),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PushNotificationSection extends StatelessWidget {
  const PushNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  Assets.icons.notification,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Text(
                'Push Notifications',
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 17.3.sp, height: getTextHeight(17.3, 24)),
              ),
            ],
          ).toPaddingOnly(bottom: 4),
          SwitchTile(
            title: 'Order Updates',
            subtitle: 'Notifications about your order status',
            value: true,
            onChanged: (value) {},
          ),
          SwitchTile(
            title: 'Promotions & Offers',
            subtitle: 'Special deals and exclusive offers',
            value: true,
            onChanged: (value) {},
          ),
          SwitchTile(
            title: 'Price Drops',
            subtitle: 'Alerts when wishlist items go on sale',
            value: false,
            onChanged: (value) {},
          ),
          SwitchTile(
            title: 'Back in Stock',
            subtitle: 'Notify when out-of-stock items are available',
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class EmailPreferencesSection extends StatelessWidget {
  const EmailPreferencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.email_outlined,
                size: 16.w,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                'Email Preferences',
                style: AppTextStyles.semiBold(
                  context,
                ).copyWith(fontSize: 17.3.sp, height: getTextHeight(17.3, 24)),
              ),
            ],
          ).toPaddingOnly(bottom: 4),
          SwitchTile(
            title: 'Order Confirmations',
            subtitle: 'Email receipts and tracking info',
            value: true,
            onChanged: (value) {},
          ),
          SwitchTile(
            title: 'Newsletter',
            subtitle: 'Weekly deals and new arrivals',
            value: true,
            onChanged: (value) {},
          ),
          SwitchTile(
            title: 'Shopping Tips',
            subtitle: 'Helpful guides and product recommendations',
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                title,
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 16.sp, height: getTextHeight(16, 24)),
              ),
              Text(
                subtitle,
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 12.sp,
                  height: getTextHeight(12, 20),
                  color: LightColors.text2Color,
                ),
              ),
            ],
          ),
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
