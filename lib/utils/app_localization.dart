import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sherif_raafat/constants/constant_shared_preferences.dart';
import 'package:sherif_raafat/my_app.dart';

/// A helper class for accessing the current localizations for the app.
class AppLocalization {
  /// Returns the `AppLocalizations` object for the current context.
  static AppLocalizations get myLocal =>
      AppLocalizations.of(navigatorKey.currentState!.overlay!.context)!;

  /// Returns the UI `Locale` for the current context.
  static Locale get myLocalUI =>
      Localizations.localeOf(navigatorKey.currentState!.overlay!.context);
}

class AppPref {
  /// snapshot of SharedPreferences
  static late SharedPreferences prefs;

  /// must init at main { setPrefAndGetUserLocal }
  static Future<String> get setPrefAndGetUserLocal async {
    prefs = await SharedPreferences.getInstance();

    return prefs.getString(UserData.appLocal) ?? UserData.nonLocal;
  }
}
