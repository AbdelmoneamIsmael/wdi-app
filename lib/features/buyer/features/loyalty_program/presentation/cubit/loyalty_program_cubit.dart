import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/loyalty_program/presentation/cubit/loyalty_program_state.dart';

class LoyaltyProgramCubit extends Cubit<LoyaltyProgramState> {
  LoyaltyProgramCubit() : super(const LoyaltyProgramState.initial());
}
