import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
}
