import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/notifications/presentation/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState.initial());
}
