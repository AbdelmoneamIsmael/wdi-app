

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/main/presentation/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());
}
