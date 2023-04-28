import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// A helper class for logging errors to Firebase Crashlytics.
class AppFirebaseCrashlytics {
// Toggle this to cause an async error to be thrown during initialization
// and to test that runZonedGuarded() catches the error
  static const _kShouldTestAsyncErrorOnInit = false;

// Toggle this for testing Crashlytics in your app locally.
  static const _kTestingCrashlytics = true;

  /// Initializes Firebase Crashlytics with the appropriate settings.
  static Future<void> initializeFireCrashlytics() async {
    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
    if (_kShouldTestAsyncErrorOnInit) {
      await _testAsyncErrorOnInit();
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static Future<void> _testAsyncErrorOnInit() async {
    Future<void>.delayed(const Duration(seconds: 2), () {
      final List<int> list = <int>[];
      print(list[100]);
    });
  }
}
