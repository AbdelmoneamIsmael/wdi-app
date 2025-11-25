

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());
}
