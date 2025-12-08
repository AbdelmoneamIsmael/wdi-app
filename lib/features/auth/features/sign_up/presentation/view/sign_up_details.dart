import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpDetails extends StatelessWidget {
  const SignUpDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Column(
          spacing: 20,
          children: [
            const AppTextFieldWithTitle(
              title: 'Email Address',
              hint: 'you@example.com',
            ),
            const AppTextFieldWithTitle(
              title: 'Store Name',
              hint: 'Your Store Name',
            ),
            AppTextFieldWithTitle(
              title: 'Password',
              hint: 'Min 8 characters',
              scure: true,
              helperText: 'Must include 1 uppercase, 1 lowercase, and 1 number',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off_outlined),
              ),
            ),
            AppTextFieldWithTitle(
              title: 'Re-enter Password',
              hint: 'Confirm your password',
              scure: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off_outlined),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.changePage(1);
              },
              child: 'Sign Up'.toText(),
            ),
          ],
        );
      },
    );
  }
}
