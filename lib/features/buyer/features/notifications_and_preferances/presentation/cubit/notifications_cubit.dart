import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/notifications_and_preferances/presentation/cubit/notifications_state.dart';

class NotificationsAndPreferencesCubit
    extends Cubit<NotificationsAndPreferencesState> {
  NotificationsAndPreferencesCubit()
    : super(const NotificationsAndPreferencesState.initial());
}
