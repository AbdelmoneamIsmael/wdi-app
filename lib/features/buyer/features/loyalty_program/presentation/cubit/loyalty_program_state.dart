
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_program_state.freezed.dart';

@freezed
class LoyaltyProgramState with _$LoyaltyProgramState {
  const factory LoyaltyProgramState.initial() = Initial;
  const factory LoyaltyProgramState.loading() = Loading;
  const factory LoyaltyProgramState.loaded() = Loaded;
  const factory LoyaltyProgramState.error(String message) = Error;
} 
