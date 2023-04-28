import 'package:flutter/material.dart';
import 'package:sherif_raafat/constants/constant_shared_preferences.dart';
import 'package:sherif_raafat/utils/app_localization.dart';

/// app supported localization
enum AppLocal {
  /// arabic
  ar,

  /// english
  en
}

///
class LocalProvider extends ChangeNotifier {
  /// The currently selected AppLocal language.
  AppLocal? _language;

  /// Returns the name of the currently selected language.
  String? get language => _language?.name;

  /// change app localization while supporting only to locale
  Future<void> changeLanguage() => setLanguage(
        _language == AppLocal.ar ? AppLocal.en : AppLocal.ar,
        reBuild: true,
      );

  /// set new app localization
  Future<void> setLanguage(AppLocal local, {bool reBuild = false}) async {
    debugPrint('new local:$local, reBuild: $reBuild');
    await AppPref.prefs.setString(UserData.appLocal, local.name);
    _language = local;
    if (reBuild) {
      notifyListeners();
    }
  }
}
