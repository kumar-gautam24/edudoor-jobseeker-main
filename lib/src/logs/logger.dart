import 'package:edudoor_jobseeker/src/configurations/application.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:logger/logger.dart';

class Log {
  Log._();

  static final Logger _logger = Logger();

  static void trace({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.t("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void debug({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.d("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void info({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.i("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void warning({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.w("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void error({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.e("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void fatal({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    if (Application.environment != Environment.production) {
      _logger.f("$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
    }
  }

  static void log({required String tag, required dynamic message, Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.debug, "$tag: $message", time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
}
