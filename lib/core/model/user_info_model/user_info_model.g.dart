// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      userId: (json['user_id'] as num?)?.toInt(),
      token: json['token'] as String?,
      userType: json['user_type'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'token': instance.token,
      'user_type': instance.userType,
      'name': instance.name,
      'email': instance.email,
    };
