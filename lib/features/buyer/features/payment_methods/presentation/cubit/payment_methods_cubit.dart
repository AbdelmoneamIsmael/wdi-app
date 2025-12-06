import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/payment_methods/presentation/cubit/payment_methods_state.dart';


class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  PaymentMethodsCubit() : super(const PaymentMethodsState.initial());
}
