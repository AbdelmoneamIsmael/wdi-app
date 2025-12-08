import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/auth/features/otp/presentation/cubit/otp_state.dart';


class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(const OtpState.initial());
}