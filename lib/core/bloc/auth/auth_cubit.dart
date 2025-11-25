import 'package:bloc/bloc.dart';
import 'package:wdi/core/bloc/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());
}
