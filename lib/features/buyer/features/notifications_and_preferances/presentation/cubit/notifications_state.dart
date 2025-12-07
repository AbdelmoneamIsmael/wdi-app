

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsAndPreferencesState with _$NotificationsAndPreferencesState {
  const factory NotificationsAndPreferencesState.initial() = Initial;
  const factory NotificationsAndPreferencesState.loading() = Loading;
  const factory NotificationsAndPreferencesState.loaded() = Loaded;
  const factory NotificationsAndPreferencesState.error(String message) = Error;
}
