  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/coupons/presentation/cubit/coupons_state.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit() : super(const CouponsState.initial());
}
