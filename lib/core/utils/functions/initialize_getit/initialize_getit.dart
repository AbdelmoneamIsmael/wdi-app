import 'package:get_it/get_it.dart';
import 'package:wdi/core/utils/api/api_server.dart';
import 'package:wdi/features/auth/features/sign_in/data/data_sources/sign_in_remote/sign_in_remote_repo.dart';
import 'package:wdi/features/auth/features/sign_in/data/repositories/sign_in_repo_impl.dart';
import 'package:wdi/features/auth/features/sign_in/domain/repositories/sign_in_repo.dart';


final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<SignInRepo>(
    SignInRepoImpl(
      signInRemoteRepo: SignInRemoteImpl(ApiServer().dio),
    ),
  );
}
