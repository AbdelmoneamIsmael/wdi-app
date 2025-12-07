import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/gen/assets.gen.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Text(
              'Help & Support',
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
            ),
            const SizedBox(height: 24),
            ContactWidget(
              title: 'Live Chat',
              subtitle: 'Chat with our support team',
              icon: Assets.icons.chat,
              onTap: () {},
              buttonText: 'Chat Now',
            ),
            const SizedBox(height: 16),
            ContactWidget(
              title: 'Phone Support',
              subtitle: '+971 4 123 4567',
              icon: Assets.icons.phone,
              onTap: () {},
              buttonText: 'Call Now',
            ),
            const SizedBox(height: 16),
            ContactWidget(
              title: 'Email Support',
              subtitle: 'support@shop.com',
              icon: Assets.icons.email,
              onTap: () {},
              buttonText: 'Send Email',
            ),
            const SizedBox(height: 24),
            const QuickLinksWidget(),
            const SizedBox(height: 24),
            const FaqWidget(),
          ],
        ),
      ),
    );
  }
}

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        ),
      ],
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.ask,
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Frequently Asked Questions',
                  style: AppTextStyles.semiBold(context).copyWith(
                    fontSize: 17.3.sp,
                    height: getTextHeight(17.3, 24),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const FaqItemWidget(title: 'How do I track my order?'),
          const FaqItemWidget(title: 'What is your return policy?'),
          const FaqItemWidget(title: 'How long does shipping take?'),
          const FaqItemWidget(title: 'Can I change my order after placing it?'),
          const FaqItemWidget(title: 'Do you offer Cash on Delivery?'),
        ],
      ),
    );
  }
}

class FaqItemWidget extends StatelessWidget {
  const FaqItemWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12).w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.medium(
                context,
              ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class QuickLinksWidget extends StatelessWidget {
  const QuickLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        ),
      ],
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Text(
            'Quick Links',
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 17.3.sp, height: getTextHeight(17.3, 24)),
          ),
          const SizedBox(height: 24),
          const QuickLinkWidget(title: 'Return & Refund Policy'),
          const SizedBox(height: 16),
          const QuickLinkWidget(title: 'Shipping Information'),
          const SizedBox(height: 16),
          const QuickLinkWidget(title: 'Terms & Conditions'),
          const SizedBox(height: 16),
          const QuickLinkWidget(title: 'Privacy Policy'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class QuickLinkWidget extends StatelessWidget {
  const QuickLinkWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.file_present),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.medium(
              context,
            ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
          ),
        ),
      ],
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.buttonText,
  });
  final String title, subtitle, icon, buttonText;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        ),
      ],
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.icons.chat,
            width: 40.w,
            height: 40.w,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 17.3.sp, height: getTextHeight(17.3, 24)),
          ),
          Text(
            subtitle,
            style: AppTextStyles.regular(context).copyWith(
              fontSize: 14.sp,
              height: getTextHeight(14, 20),
              color: LightColors.text2Color,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFAFAFA),
              elevation: 0,
              side: BorderSide(color: Theme.of(context).dividerColor, width: 1),
              foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: onTap,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
