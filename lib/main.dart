import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/bloc/bloc_observer.dart';
import '/core/const/app_const.dart';
import '/core/model/app_model/app_model.dart';
import '/core/utils/cache_helper.dart';
import '/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'wdi_app.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initLocalization();
  initDebugMode();
  await initLocalization();
  await CacheHelper.init();
  initializeGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      // startLocale: Locale('ar', 'SA'),
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar', 'SA'),
      child: DevicePreview(
        enabled: false,
        builder: (context) => const WDIApp(),
      ),
    ),
  );
}

Future<void> initLocalization() async {
  await EasyLocalization.ensureInitialized();
}

void initDebugMode() {
  appModel = ApplicationModel(
    baseUrl: devBaseURl,
    flavor: ApplicationMode.development,
    applicationName: kAppName,
    theme: ApplicationTheme.light,
    language: ApplicationLanguage.en,
    fontFamily: kFontFamily,
  );

  appModel.flavor = ApplicationMode.development;
  appModel.baseUrl = devBaseURl;
}
