import 'package:firebase_core/firebase_core.dart';
import 'package:sherif_raafat/utils/firebase/app_firebase_crashlytics.dart';

/// A helper class for initializing Firebase in the application.
///
/// This class provides a static method for initializing Firebase
/// in the application, which
/// sets up the Firebase services and configures them
/// with the appropriate settings.
class MyFirebaseApp {
  /// Initializes Firebase in the application.
  static Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();

    /// Initializes Firebase Crashlytics in the application.
    await AppFirebaseCrashlytics.initializeFireCrashlytics();
  }
}
