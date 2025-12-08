import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_drop_down.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
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
                      'Create Account',
                      style: AppTextStyles.bold(context).copyWith(
                        fontSize: 28.6.sp,
                        height: getTextHeight(28.6, 36),
                      ),
                    ),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        final cubit = context.read<SignUpCubit>();
                        return Text(
                          cubit.pageTitles[cubit.currentPage],
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 15.6.sp,
                            height: getTextHeight(15.6, 20.8),
                            color: LightColors.text2Color,
                          ),
                        );
                      },
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        final cubit = context.read<SignUpCubit>();
                        return Column(
                          children: [
                            LinearProgressIndicator(
                              value:
                                  (cubit.currentPage + 1) /
                                  (cubit.pages.length),
                              color: LightColors.primaryColor,
                              backgroundColor: LightColors.lightGreyColor,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(9999),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                Text(
                                  'Details',
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 12.sp,
                                    height: getTextHeight(12, 16),
                                    color: cubit.currentPage == 0
                                        ? LightColors.primaryColor
                                        : LightColors.text2Color,
                                  ),
                                ),
                                Text(
                                  'Email',
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 12.sp,
                                    height: getTextHeight(12, 16),
                                    color: cubit.currentPage == 1
                                        ? LightColors.primaryColor
                                        : LightColors.text2Color,
                                  ),
                                ),
                                Text(
                                  'Phone',
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 12.sp,
                                    height: getTextHeight(12, 16),
                                    color: cubit.currentPage == 2
                                        ? LightColors.primaryColor
                                        : LightColors.text2Color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        final cubit = context.read<SignUpCubit>();
                        return ExpandablePageView.builder(
                          controller: cubit.pageController,
                          itemCount: cubit.pages.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => cubit.pages[index],
                        );
                      },
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        final cubit = context.read<SignUpCubit>();
                        return cubit.currentPage > 0
                            ? TextButton(
                                onPressed: () {
                                  cubit.back();
                                },
                                child: 'Back'.toText(
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 14.sp,
                                    height: getTextHeight(14, 20),
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        const Expanded(
                          child: Divider(color: LightColors.greyColor),
                        ),
                        'Already have an account?'.toText(
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
                      onPressed: () {},
                      child: 'Sign In'.toText(),
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
