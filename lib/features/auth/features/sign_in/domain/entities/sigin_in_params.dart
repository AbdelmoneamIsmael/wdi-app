import 'package:json_annotation/json_annotation.dart';

part 'sigin_in_params.g.dart';

@JsonSerializable()
class SignInParams {
  SignInParams({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  SignInParams copyWith({
    String? email,
    String? password,
  }) {
    return SignInParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory SignInParams.fromJson(Map<String, dynamic> json) => _$SignInParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SignInParamsToJson(this);

  @override
  String toString(){
    return "$email, $password, ";
  }

}

/*
{
	"email": "amrelsebaey5@gmail.com",
	"password": "Aa#12357"
}*/