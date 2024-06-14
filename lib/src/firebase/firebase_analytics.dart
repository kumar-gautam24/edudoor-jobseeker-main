import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class TrackingService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static FirebaseAnalytics getAnalytics() => _analytics;

  static void setUserId(String userId) {
    _analytics.setUserId(id: userId);
  }

  static void setUserProperty(String name, String value) {
    _analytics.setUserProperty(name: name, value: value);
  }

  static void logViewItem(double price, List<AnalyticsEventItem> items) {
    _analytics.logViewItem(currency: "INR", value: price, items: items);
  }

  static void logBeginCheckOut(double price, List<AnalyticsEventItem> items) {
    _analytics.logBeginCheckout(currency: "INR", value: price, items: items);
  }

  static void logPurchase(double price, List<AnalyticsEventItem> items) {
    _analytics.logPurchase(currency: "INR", value: price, items: items);
  }

  static void logScreenView(String screenName) {
    _analytics.logScreenView(screenName: screenName, parameters: {
      "user_id": AllBloc.authenticationBloc.jobseekerModel?.id ?? "UNKNOWN",
      'user_email': AllBloc.authenticationBloc.jobseekerModel?.email ?? "UNKNOWN",
      "user_phone": AllBloc.authenticationBloc.jobseekerModel?.phone ?? "UNKNOWN",
      "user_name": AllBloc.authenticationBloc.jobseekerModel?.fullName ?? "UNKNOWN",
      screenName: screenName,
    });
  }

  static void logEvent(String eventName, {Map<String, dynamic>? parameters}) {
    _analytics.logEvent(name: eventName, parameters: parameters);
  }

  static void logError(dynamic error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  static void logButtonTap(String buttonName) {
    logEvent('button_tap', parameters: {'button_name': buttonName});
  }

  static void logButtonLongPress(String buttonName) {
    logEvent('button_long_press', parameters: {'button_name': buttonName});
  }

  static void logScrollEvent(double scrollOffset, String page) {
    logEvent('scroll', parameters: {'page': page, 'scroll_offset': scrollOffset});
  }

  static void logNavigation(String? from, String? to) {
    Log.log(tag: "NAVIGATION", message: "Navigating from ${from??"unknown_page_OR_dialog"} to ${to??"unknown_page_OR_dialog"}");
    logEvent('navigation', parameters: {'from': from ?? 'unknown_page', 'to': to ?? 'unknown_page'});
  }

  static void logScreenDuration(String screenName, int durationSeconds) {
    logEvent('screen_view', parameters: {'screen_name': screenName, 'duration_seconds': durationSeconds});
  }
}
