import 'package:wdi/core/errors/error_class.dart';
import 'package:wdi/core/model/general_reponse_model/general_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:wdi/features/auth/features/sign_in/domain/entities/sigin_in_params.dart';

import '../../../../../../core/model/user_info_model/user_info_model.dart';

abstract class SignInRepo {
 Future<Either<Failure,GeneralResponseModel<UserInfoModel>>> signIn({required SignInParams signInParams});
}