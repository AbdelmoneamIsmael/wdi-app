import 'package:bloc/bloc.dart';
import 'package:wdi/features/auth/features/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(const ForgetPasswordState.initial());
  
}
