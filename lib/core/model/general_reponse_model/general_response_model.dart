import 'package:json_annotation/json_annotation.dart';

part 'general_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GeneralResponseModel<T> {
  factory GeneralResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$GeneralResponseModelFromJson(json, fromJsonT);
  GeneralResponseModel({
    required this.data,
    required this.success,
    required this.message,
    required this.status,
    required this.timestamp,
    required this.errorCode,
  });
  final int? status;
  final T? data;
  final bool? success;
  final String? message;
  final DateTime? timestamp;
  @JsonKey(name: 'error_code')
  final String? errorCode;

  GeneralResponseModel copyWith({
    int? status,
    T? data,
    bool? success,
    String? message,
    DateTime? timestamp,
    String? errorCode
  }) {
    return GeneralResponseModel(
      status: status ?? this.status,
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      errorCode: errorCode?? this.errorCode,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$GeneralResponseModelToJson(this, toJsonT);

  @override
  String toString() {
    return '$status, $data, $success, $message,$timestamp ,$errorCode';
  }
}
