import '../model/app_model/app_model.dart' show ApplicationModel;
import '../routes/pages_keys.dart';

const devBaseURl = 'https://aman.runasp.net';
const prodBaseURl = 'https://aman.runasp.net';
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
