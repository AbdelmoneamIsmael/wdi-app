import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success() = Success;
  const factory SignUpState.error(String message) = Error;
  const factory SignUpState.pageChanged(int page) = PageChanged;
}
