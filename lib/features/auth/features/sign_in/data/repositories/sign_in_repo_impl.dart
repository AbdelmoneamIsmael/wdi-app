import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wdi/core/errors/error_class.dart';
import 'package:wdi/core/model/general_reponse_model/general_response_model.dart';
import 'package:wdi/core/model/user_info_model/user_info_model.dart';
import 'package:wdi/features/auth/features/sign_in/data/data_sources/sign_in_remote/sign_in_remote_repo.dart';
import 'package:wdi/features/auth/features/sign_in/domain/entities/sigin_in_params.dart';
import 'package:wdi/features/auth/features/sign_in/domain/repositories/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo{


  final SignInRemoteRepo signInRemoteRepo;

  SignInRepoImpl({required this.signInRemoteRepo});


  @override
  Future<Either<Failure, GeneralResponseModel<UserInfoModel>>> signIn({required SignInParams signInParams}) async {
    try{
      final result = await signInRemoteRepo.signInCall(signInParams);
      return Right(result);
    }
        catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }else{
        return Left(ServerFailure(e.toString()));
      }
        }
  }
}