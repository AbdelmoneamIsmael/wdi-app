import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = Initial;
  const factory AccountState.loading() = Loading;
  const factory AccountState.loaded() = Loaded;
  const factory AccountState.error(String message) = Error;
} 
