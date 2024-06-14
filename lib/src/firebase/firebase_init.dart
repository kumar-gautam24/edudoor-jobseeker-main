import 'package:edudoor_jobseeker/src/firebase/firebase_options.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInit {
  FirebaseInit._();
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (error) {
      Log.error(tag: "FIREBASE_INIT", message: "Firebase initialization failed: $error");
    }
  }
}
