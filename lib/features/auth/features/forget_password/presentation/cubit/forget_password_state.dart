import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = Initial;
  const factory ForgetPasswordState.loading() = Loading;
  const factory ForgetPasswordState.success() = Success;
  const factory ForgetPasswordState.error(String message) = Error;
}