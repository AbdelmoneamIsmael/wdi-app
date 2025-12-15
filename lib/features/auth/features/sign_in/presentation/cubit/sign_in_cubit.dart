
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/auth/features/sign_in/domain/entities/sigin_in_params.dart';
import 'package:wdi/features/auth/features/sign_in/domain/repositories/sign_in_repo.dart';
import 'package:wdi/features/auth/features/sign_in/presentation/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.signInRepo}) : super(const SignInState.initial());

  final SignInRepo signInRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

 Future<void> signIn()async{
    try{
      if(loginForm.currentState!.validate()){
        emit(SignInState.loading());
        final result = await signInRepo.signIn(signInParams: SignInParams(email: emailController.text,
            password: passwordController.text));
        result.fold((l){
          emit(SignInState.error(l.message.toString()));
        }, (r){
          print(r);
          emit(SignInState.success());
        });
      }
    }
        catch(e){
      emit(SignInState.error(e.toString()));
        }
 }
}
