import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_support_state.freezed.dart';

@freezed
class HelpSupportState with _$HelpSupportState {
  const factory HelpSupportState.initial() = Initial;
  const factory HelpSupportState.loading() = Loading;
  const factory HelpSupportState.loaded() = Loaded;
  const factory HelpSupportState.error(String message) = Error;
} 
