import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/view/sign_up_details.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/view/sign_up_email.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/view/sign_up_phone.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());

  final PageController pageController = PageController();
  int currentPage = 0;
  List<Widget> pages = [
    const SignUpDetails(),
    const SignUpEmail(),
    const SignUpPhone(),
  ];
  List<String> pageTitles = [
    'Fill in your details to get started',
    'Verify your email address',
    'Verify your phone number',
  ];
  void changePage(int index) {
    currentPage = index;

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(SignUpState.pageChanged(index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void back() {
    if (currentPage > 0) {
      currentPage--;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(SignUpState.pageChanged(currentPage));
    }
  }
}
