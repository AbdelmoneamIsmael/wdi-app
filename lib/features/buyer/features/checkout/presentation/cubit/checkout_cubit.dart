import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/view/adress_view.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/view/final_review.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/view/pay_ment_view.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/view/shipping_view.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState.initial());
  final PageController pageController = PageController();
  int currentStep = 1;
  List<Widget> steps = [
    const AddressView(),
    const ShippingView(),
    const PayMentView(),
    const FinalReview(),
  ];
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void setCurrentStep(int step) {
    if (step == 5) {
      currentStep = 1;
    }

    if (step > 0 && step <= 4) {
      print('step: $step');
      currentStep = step;
      pageController.jumpToPage(step - 1);

      emit(ChangeStep(step));
    }
  }
}
