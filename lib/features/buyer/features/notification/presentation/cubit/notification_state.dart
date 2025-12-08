import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = Initial;
  const factory NotificationState.loading() = Loading;
  const factory NotificationState.loaded() = Loaded;
  const factory NotificationState.error(String message) = Error;
}
