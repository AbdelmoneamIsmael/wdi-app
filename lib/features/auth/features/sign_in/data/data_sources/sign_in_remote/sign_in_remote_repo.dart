import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wdi/core/const/app_endpoints.dart';
import 'package:wdi/core/model/general_reponse_model/general_response_model.dart';
import 'package:wdi/core/model/user_info_model/user_info_model.dart';
import 'package:wdi/features/auth/features/sign_in/domain/entities/sigin_in_params.dart';
import 'package:retrofit/retrofit.dart';
part 'sign_in_remote_repo.g.dart';


abstract class SignInRemoteRepo {

  Future<GeneralResponseModel<UserInfoModel>> signInCall(SignInParams signInParams);


}

@RestApi()
abstract class SignInRemoteImpl extends SignInRemoteRepo{

  factory SignInRemoteImpl(Dio dio, {String? baseUrl}) = _SignInRemoteImpl;

  @override
  @POST(AppEndpoints.signIn)
  Future<GeneralResponseModel<UserInfoModel>> signInCall(@Body() SignInParams signInParams) ;

}