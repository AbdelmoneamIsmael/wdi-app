import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupons_state.freezed.dart';

@freezed
class CouponsState with _$CouponsState {
  const factory CouponsState.initial() = Initial;
  const factory CouponsState.loading() = Loading;
  const factory CouponsState.loaded() = Loaded;
  const factory CouponsState.error(String message) = Error;
} 
