import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/routes/pages_keys.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/primary_container.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.themeColor,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32).w,
            sliver: SliverFillRemaining(
              hasScrollBody: false,

              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryContainer(
                    color: LightColors.themeColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ).w,
                    withShadow: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.goNamed(PagesKeys.signIn);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: LightColors.text2Color,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Back to login',
                              style: AppTextStyles.regular(context).copyWith(
                                fontSize: 13.6.sp,
                                height: getTextHeight(13.6, 19.36),
                                color: LightColors.text2Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Verify Email',
                          style: AppTextStyles.bold(
                            context,
                          ).copyWith(fontSize: 26.sp, height: 1.5),
                        ),
                        const SizedBox(),
                        'Enter the code sent to your email'.toText(
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 14.sp,
                            height: getTextHeight(14, 20),
                            color: LightColors.text2Color,
                          ),
                        ),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24).w,
                          decoration: BoxDecoration(
                            color: const Color(0XFFFAFAFA),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "We've sent a 6-digit code to",
                                style: AppTextStyles.regular(context).copyWith(
                                  fontSize: 14.sp,
                                  height: getTextHeight(14, 20),
                                  color: LightColors.text2Color,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'email-name@gmail.com',
                                style: AppTextStyles.bold(context).copyWith(
                                  fontSize: 16.sp,
                                  height: getTextHeight(16, 22),
                                  color: LightColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        const AppTextFieldWithTitle(
                          title: 'Verification code',
                          hint: '000000',
                        ),
                        const SizedBox(),
                        const SizedBox(),
                        ElevatedButton(
                          onPressed: () {},
                          child: 'Verify'.toText(),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: 'Resend OTP'.toText(
                              style: AppTextStyles.medium(context).copyWith(
                                fontSize: 14.sp,
                                height: getTextHeight(14, 20),
                                color: LightColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
