
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = Initial;
  const factory CheckoutState.changeStep(int step) = ChangeStep;


}
