// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponseModel<T> _$GeneralResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => GeneralResponseModel<T>(
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  status: (json['status'] as num?)?.toInt(),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$GeneralResponseModelToJson<T>(
  GeneralResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': instance.status,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'success': instance.success,
  'message': instance.message,
  'timestamp': instance.timestamp?.toIso8601String(),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
