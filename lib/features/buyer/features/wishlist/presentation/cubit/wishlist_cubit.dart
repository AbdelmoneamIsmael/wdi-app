
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState.initial());
}
