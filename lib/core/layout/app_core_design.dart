import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app/app_state.dart';

import '../bloc/app/app_cubit.dart';
import '../const/app_const.dart';
import '../routes/page_routes.dart';

class ApplicationDesign extends StatelessWidget {
  const ApplicationDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // final appCubit = BlocProvider.of<AppCubit>(context);
        return MaterialApp.router(
          routerConfig: PageRoutes.router,
          title: kAppName,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            return child!;
          },
          debugShowCheckedModeBanner: false,

          // theme: theme,
        );
      },
    );
  }
}
