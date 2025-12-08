import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/routes/pages_keys.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_drop_down.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/primary_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32).w,
          child: Column(
            children: [
              PrimaryContainer(
                withShadow: true,
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Welcome Back',
                      style: AppTextStyles.bold(context).copyWith(
                        fontSize: 28.6.sp,
                        height: getTextHeight(28.6, 36),
                      ),
                    ),
                    Text(
                      'Sign in to your account',
                      style: AppTextStyles.regular(context).copyWith(
                        fontSize: 15.6.sp,
                        height: getTextHeight(15.6, 20.8),
                        color: LightColors.text2Color,
                      ),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    AppDropDown(
                      title: 'Country Code',
                      items: const [
                        DropdownMenuItem(
                          value: 'ae',
                          child: Text('+971 (UAE)'),
                        ),
                        DropdownMenuItem(
                          value: 'sa',
                          child: Text('+966 (Saudi Arabia)'),
                        ),
                        DropdownMenuItem(
                          value: 'eg',
                          child: Text('+20 (Egypt)'),
                        ),
                        DropdownMenuItem(
                          value: 'qa',
                          child: Text('+974 (Qatar)'),
                        ),
                        DropdownMenuItem(
                          value: 'bh',
                          child: Text('+973 (Bahrain)'),
                        ),
                        DropdownMenuItem(
                          value: 'kw',
                          child: Text('+965 (Kuwait)'),
                        ),
                        DropdownMenuItem(
                          value: 'om',
                          child: Text('+968 (Oman)'),
                        ),
                      ],
                      initialValue: 'ae',
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 3),
                    const AppTextFieldWithTitle(
                      title: 'Phone / Email',
                      hint: 'Enter phone or email',
                    ),
                    const SizedBox(height: 3),

                    AppTextFieldWithTitle(
                      title: 'Password',
                      hint: 'Enter password',
                      scure: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    const SizedBox(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(PagesKeys.forgetPassword);
                        },
                        child: 'Forgot Password?'.toText(
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 13.6.sp,
                            height: getTextHeight(13.6, 19.36),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                    ElevatedButton(onPressed: () {}, child: 'Login'.toText()),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        const Expanded(
                          child: Divider(color: LightColors.greyColor),
                        ),
                        'Don’t have an account?'.toText(
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 12.sp,
                            height: getTextHeight(12, 16.8),
                            color: LightColors.greyColor,
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: LightColors.greyColor),
                        ),
                      ],
                    ),
                    const SizedBox(),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFAFAFA),
                        foregroundColor: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.color,
                        textStyle: AppTextStyles.regular(context).copyWith(
                          fontSize: 13.6.sp,
                          height: getTextHeight(13.6, 19.36),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(color: Color(0xffE4E4E7)),
                        ),
                      ),
                      onPressed: () {
                        context.pushNamed(PagesKeys.signUp);
                      },
                      child: 'Sign up'.toText(),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 8),
                        Text(
                          'Language: EN',
                          style: AppTextStyles.medium(context).copyWith(
                            fontSize: 13.6.sp,
                            height: getTextHeight(13.6, 19.36),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
