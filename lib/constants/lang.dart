import 'package:flutter/cupertino.dart';

class LangManager {
  static LangManager? _instance;
  static LangManager get instance {
    _instance ??= LangManager._init();
    return _instance!;
  }

  LangManager._init();
  final enLocale = Locale('en', 'US');
  List<Locale> get supportedLocales => [enLocale];
}

class ApplicationConstants {
  static const LANG_ASSET_PATH = 'assets/translations';
}
