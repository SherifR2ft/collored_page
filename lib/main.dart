import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sherif_raafat/common_widgets/custom_flutter_error_widget.dart';
import 'package:sherif_raafat/feautres/local_feautre/local_provider.dart';
import 'package:sherif_raafat/feautres/randomly_generated_color_feautre/random_color_generator_provider.dart';
import 'package:sherif_raafat/my_app.dart';
import 'package:sherif_raafat/utils/firebase/my_firebase_app.dart';

void main() {
  ///Custom Flutter Error Widget instead of Error Red Screen
  ErrorWidget.builder = (FlutterErrorDetails details) {
    debugPrint('ErrorWidget.builder:');
    debugPrint('error: ${details.exception}');
    debugPrint('stackTrace: ${details.stack}');
    // inform FirebaseCrashlytics
    FirebaseCrashlytics.instance.recordError(details.exception, details.stack);

    return const CustomFlutterErrorWidget();
  };

  runZonedGuarded(() async {
    // for {PackageInfo} package and FCM
    WidgetsFlutterBinding.ensureInitialized();
    await MyFirebaseApp.initializeFlutterFire();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<LocalProvider>(
            create: (context) => LocalProvider(),
          ),
          ChangeNotifierProvider<RandomColorGeneratorProvider>(
            create: (context) => RandomColorGeneratorProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) {
    debugPrint('runZonedGuarded: Caught error in my root zone.');
    debugPrint('error: $error');
    debugPrint('stackTrace: $stackTrace');
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
