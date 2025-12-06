

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = Initial;
  const factory NotificationsState.loading() = Loading;
  const factory NotificationsState.loaded() = Loaded;
  const factory NotificationsState.error(String message) = Error;
}
