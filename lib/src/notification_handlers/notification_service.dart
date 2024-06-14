import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/resources/jobseeker_repo.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(alert: true, announcement: true, badge: true, carPlay: true, criticalAlert: true, provisional: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized || settings.authorizationStatus == AuthorizationStatus.provisional) {
      Log.info(tag: "FIREBASE NOTIFICATION", message: "Notification Authorized");
    } else {
      Log.info(tag: "FIREBASE NOTIFICATION", message: "Notification is not Authorized");
    }

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> handleReceivedNotification() async {
    await requestPermissions();

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        Log.info(tag: "ON_GET_INITIAL_ON_TAP", message: message.toMap());
        handleTouchOnNotification(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // dialogAnimationWrapper(
      //   dismissible: false,
      //   context: Get.context,
      //   child: DialogConfirm(
      //     height: 165.sp,
      //     title: message.notification!.title!,
      //     subTitle: message.notification!.body!,
      //     handleConfirm: () {
      //       handleTouchOnNotification(message);
      //     },
      //   ),
      // );
      handleTouchOnNotification(message);
      Log.info(tag: "ON_FOREGROUND_NOTIFICATION", message: message.toMap());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleTouchOnNotification(message);
      Log.info(tag: "ON_FOREGROUND_NOTIFICATION_ON_TAP", message: message.toMap());
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    Log.info(tag: "ON_BACKGROUND_NOTIFICATION", message: message.toMap());
  }

  static Future<String?> getDeviceToken() async {
    Log.debug(tag: "FCM Token", message: "Getting FCM Token ${await messaging.getToken()}");
    return await messaging.getToken();
  }

  static void onTokenRefresh() {
    messaging.onTokenRefresh.listen((event) async {
      Log.info(tag: "ON_TOKEN_REFRESH", message: event);
      await JobseekerRepo().updateJobseeker(data: {"firebaseToken": event.toString()});
    });
  }

  static void handleTouchOnNotification(RemoteMessage message) {
    String? route = message.data['route'];
    if (route != null) {
      AppNavigator.push(route, arguments: message.data);
    }
  }
}
