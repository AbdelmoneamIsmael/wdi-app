import '../model/app_model/app_model.dart' show ApplicationModel;
import '../routes/pages_keys.dart';

const devBaseURl = 'https://wdione.com/api';
const prodBaseURl = 'https://wdione.com/api';
String kDeviceToken = '';
String kInitialRoute = '/${PagesKeys.mainScreen}';
const kFontFamily = 'Inter';
const kAppName = 'WDI';
late ApplicationModel appModel;

// const internalLocalError = 700; // englishFont = "Poppins";

abstract class StorageKeys {
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';
  static const String lang = 'lang';
}
