
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_state.freezed.dart';

@freezed
class PaymentMethodsState with _$PaymentMethodsState {
  const factory PaymentMethodsState.initial() = Initial;
  const factory PaymentMethodsState.loading() = Loading;
  const factory PaymentMethodsState.loaded() = Loaded;
  const factory PaymentMethodsState.error(String message) = Error;
}   
