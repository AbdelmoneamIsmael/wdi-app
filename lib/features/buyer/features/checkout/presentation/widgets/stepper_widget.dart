import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_state.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
          return Column(
            children: [
              EasyStepper(
                activeStep:
                    checkoutCubit.currentStep -
                    1, // EasyStepper uses 0-based index
                direction: Axis.horizontal,
                padding: EdgeInsets.zero,
                fitWidth: true,
                stepRadius: 14.w,
                lineStyle: LineStyle(
                  borderRadius: BorderRadius.circular(14.w),
                  activeLineColor: LightColors.lightGreyColor,
                  finishedLineColor: LightColors.primaryColor,
                  lineType: LineType.normal,
                  unreachedLineType: LineType.dashed,
                ),
                finishedStepBackgroundColor: LightColors.primaryColor,
                activeStepBorderColor: LightColors.primaryColor,
                finishedStepBorderColor: LightColors.greyColor,
                activeStepTextColor: LightColors.primaryColor,
                finishedStepTextColor: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color,
                activeStepIconColor: LightColors.primaryColor,
                finishedStepIconColor: LightColors.greyColor,
                borderThickness: 1.38,
                unreachedStepBorderType: BorderType.normal,
                unreachedStepBackgroundColor: Colors.transparent,

                activeStepBorderType: BorderType.normal,
                defaultStepBorderType: BorderType.normal,

                steps: [
                  EasyStep(
                    customStep: StepWidget(
                      currentStep: checkoutCubit.currentStep,
                      stepNumber: 1,
                      onTap: () {
                        checkoutCubit.setCurrentStep(1);
                      },
                    ),
                    title: 'Address',
                  ),
                  EasyStep(
                    customStep: StepWidget(
                      currentStep: checkoutCubit.currentStep,
                      stepNumber: 2,
                      onTap: () {
                        checkoutCubit.setCurrentStep(2);
                      },
                    ),
                    title: 'Shipping',
                  ),
                  EasyStep(
                    customStep: StepWidget(
                      currentStep: checkoutCubit.currentStep,
                      stepNumber: 3,
                      onTap: () {
                        checkoutCubit.setCurrentStep(3);
                      },
                    ),
                    title: 'Payment',
                  ),
                  EasyStep(
                    customStep: StepWidget(
                      onTap: () {
                        checkoutCubit.setCurrentStep(4);
                      },
                      currentStep: checkoutCubit.currentStep,
                      stepNumber: 4,
                    ),

                    title: 'Review',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
    required this.currentStep,
    required this.stepNumber,
    this.onTap,
  });
  final int stepNumber;
  final int currentStep;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: currentStep > stepNumber
            ? Icon(Icons.check, color: Colors.white, size: 16.sp)
            : Text(
                stepNumber.toString(),
                style: AppTextStyles.bold(context).copyWith(
                  fontSize: 16.sp,
                  color: currentStep == 1 ? null : LightColors.greyColor,
                ),
              ),
      ),
    );
  }
}
