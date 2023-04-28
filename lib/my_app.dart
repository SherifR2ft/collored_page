import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sherif_raafat/common_widgets/splash.dart';
import 'package:sherif_raafat/constants/app_colors.dart';
import 'package:sherif_raafat/constants/constant_shared_preferences.dart';
import 'package:sherif_raafat/constants/themes_styles.dart';
import 'package:sherif_raafat/feautres/local_feautre/local_provider.dart';
import 'package:sherif_raafat/feautres/randomly_generated_color_feautre/pages/colored_page.dart';
import 'package:sherif_raafat/utils/app_localization.dart';
import 'package:sherif_raafat/utils/extension/local_font_family.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String deviceDefaultLocal = SystemData.defaultLocal.name;
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return FutureBuilder<String>(
      future: AppPref.setPrefAndGetUserLocal,
      builder: (buildContext, snapshot) {
        return (snapshot.hasData)
            ? Consumer<LocalProvider>(
                builder: (context, value, child) {
                  return MaterialApp(
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocal.values
                        .map((locale) => Locale(locale.name, ''))
                        .toList(),
                    // null => avoid rebuilding
                    // with {localeResolutionCallback} value.
                    locale: (value.language == null)
                        ? null
                        : Locale(value.language!, ''),
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      // {value.language} must be null
                      // because {snapshot} is get at startup of app.
                      // so when update consumer {snapshot}
                      // has old value first shot
                      if (snapshot.data == UserData.nonLocal &&
                          value.language == null) {
                        debugPrint('user has no local');
                        debugPrint(deviceLocale.toString());
                        // make sure that device locale
                        // is supported {'ar' or 'en'}
                        if (supportedLocales.any(
                          (element) =>
                              element.languageCode ==
                              deviceLocale?.languageCode,
                        )) {
                          debugPrint('supported device local');
                          Provider.of<LocalProvider>(context, listen: false)
                              .setLanguage(
                            AppLocal.values.firstWhere(
                              (element) =>
                                  element.name == deviceLocale!.languageCode,
                            ),
                            reBuild: false,
                          );
                          deviceDefaultLocal = deviceLocale!.languageCode;

                          return Locale(deviceLocale.languageCode);
                        } else {
                          // default locale
                          debugPrint('not supported device local');
                          Provider.of<LocalProvider>(context, listen: false)
                              .setLanguage(
                            SystemData.defaultLocal,
                            reBuild: false,
                          );

                          return Locale(SystemData.defaultLocal.name);
                        }
                      }
                      // null => avoid rebuilding with {locale} value.

                      return null;
                    },
                    theme: ThemeData(
                      // This is the theme of your application.
                      fontFamily: (value.language == null)
                          ? deviceDefaultLocal.familyFont
                          : value.language.familyFont,
                      splashColor: AppColors.primaryBackGroundColor,
                      primaryColor: AppColors.primaryBackGroundColor,
                      indicatorColor: AppColors.indicatorColor,
                      scaffoldBackgroundColor: AppColors.primaryBackGroundColor,
                      textTheme: textTheme, colorScheme: colorScheme,
                    ),
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigatorKey,
                    routes: {
                      '/': (context) => const ColoredPage(),
                    },

                    /// add set AppSize to all initialRoute screens
                    initialRoute: '/',
                  );
                },
              )
            : const Splash();
      },
    );
  }
}
