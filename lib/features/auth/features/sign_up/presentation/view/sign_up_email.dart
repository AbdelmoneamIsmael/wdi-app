import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,

      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: const Color(0xff7C3BED).withValues(alpha: 0.1),
          child: Icon(
            Icons.check_circle_outline,
            color: const Color(0xff7C3BED),
            size: 30.w,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "We've sent a 6-digit code to",
                style: AppTextStyles.regular(context).copyWith(
                  fontSize: 14.sp,
                  height: getTextHeight(14, 20),
                  color: LightColors.text2Color,
                ),
              ),
              TextSpan(
                text: ' dx@fdf',
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 14.sp,
                  height: getTextHeight(14, 20),
                  color: LightColors.greyColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(),
        const SizedBox(),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final cubit = context.read<SignUpCubit>();
            return const AppTextFieldWithTitle(
              title: 'Enter OTP',
              hint: '000000',
            );
          },
        ),
        const SizedBox(),
        const SizedBox(),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final cubit = context.read<SignUpCubit>();
            return ElevatedButton(
              onPressed: () {
                cubit.changePage(2);
              },
              child: 'Verify'.toText(),
            );
          },
        ),
        const SizedBox(),
        TextButton(
          onPressed: () {},
          child: 'Resend OTP'.toText(
            style: AppTextStyles.medium(
              context,
            ).copyWith(fontSize: 14.sp, height: getTextHeight(14, 20)),
          ),
        ),
      ],
    );
  }
}
