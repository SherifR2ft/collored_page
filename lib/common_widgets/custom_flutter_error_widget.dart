import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sherif_raafat/constants/themes_styles.dart';

/// A custom widget that displays an error message when a Flutter error occurs.
class CustomFlutterErrorWidget extends StatelessWidget {
  /// This widget is used as the default error widget for the application,
  /// and is displayed when an unhandled Flutter error occurs.
  /// It displays an error message with a stack trace to help diagnose
  /// the cause of the error.
  const CustomFlutterErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    final height = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  'assets/images/splash.png',
                  height: width,
                  width: width,
                ),
              ),
              Text(
                AppLocalizations.of(context)?.errorHappen ?? '',
                textAlign: TextAlign.center,
                style: errorStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
