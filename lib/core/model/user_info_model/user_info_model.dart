import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  UserInfoModel({
    required this.userId,
    required this.token,
    required this.userType,
    required this.name,
    required this.email,
  });

  @JsonKey(name: 'user_id')
  final int? userId;
  final String? token;

  @JsonKey(name: 'user_type')
  final String? userType;
  final String? name;
  final String? email;

  UserInfoModel copyWith({
    int? userId,
    String? token,
    String? userType,
    String? name,
    String? email,
  }) {
    return UserInfoModel(
      userId: userId ?? this.userId,
      token: token ?? this.token,
      userType: userType ?? this.userType,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  @override
  String toString(){
    return "$userId, $token, $userType, $name, $email, ";
  }

}

/*
{
	"user_id": 14,
	"token": "kTE53luOwjj8Z2ij-g0K9BbyFh6pO8ucat26EZb3aYg",
	"user_type": "buyer",
	"name": "amr Doe",
	"email": "amrelsebaey5@gmail.com"
}*/