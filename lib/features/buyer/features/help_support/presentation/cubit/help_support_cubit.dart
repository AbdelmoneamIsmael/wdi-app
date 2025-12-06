import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/help_support/presentation/cubit/help_support_state.dart';


class HelpSupportCubit extends Cubit<HelpSupportState> {
  HelpSupportCubit() : super(const HelpSupportState.initial());
}
