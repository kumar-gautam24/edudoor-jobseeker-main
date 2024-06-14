import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';

class Application {
  Application._();

  static final Application _instance = Application._();

  factory Application() {
    return _instance;
  }

  static Environment environment = Environment.development;
  static const String appVersion = '1.0.0';
  static const String appName = 'Edudoor Jobseeker';
  static const String googleMapApiKey = 'AIzaSyC6-HTk9TbnPmFXO1ZiVgCwnUSTDL2hSFM';
  static const String baseUrl = 'http://192.168.96.193:';

  Future<void> initApplication() async {
    environment = Environment.development;
    try {
      // await Future.delayed(const Duration(seconds: 4));
    } catch (error) {
      Log.error(tag: "APPLICATION INITIALIZATION", message: "Failed to initialize the app $error");
    }
  }
}
