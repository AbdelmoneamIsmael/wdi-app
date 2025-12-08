
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/auth/features/sign_in/presentation/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());
}
