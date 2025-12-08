import 'package:bloc/bloc.dart';
import 'package:wdi/features/buyer/features/notification/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.initial());
}
