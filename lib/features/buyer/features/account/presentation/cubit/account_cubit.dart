
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/account/presentation/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.initial());
}
