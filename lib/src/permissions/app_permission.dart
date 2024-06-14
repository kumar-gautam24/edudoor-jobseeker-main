import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/notification_handlers/notification_service.dart';
import 'package:edudoor_jobseeker/src/secure_storage/local_storage_keys.dart';
import 'package:edudoor_jobseeker/src/secure_storage/secure_storage.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class AppPermission {
  AppPermission._();

  static final AppPermission _instance = AppPermission._();

  factory AppPermission() {
    return _instance;
  }

  static Future<void> notificationPermissionRequest() async {
    await NotificationService.requestPermissions();
  }

  static Future<CustomLocationPermission> geoLocationPermissionRequest() async {
    LocationPermission status = await Geolocator.checkPermission();
    CustomLocationPermission permission = (status == LocationPermission.denied || status == LocationPermission.deniedForever) ? CustomLocationPermission.denied : CustomLocationPermission.granted;

    if (permission == CustomLocationPermission.denied) {
      status = await Geolocator.requestPermission();
      permission = (status == LocationPermission.denied || status == LocationPermission.deniedForever) ? CustomLocationPermission.denied : CustomLocationPermission.granted;
    }
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      permission = CustomLocationPermission.disable;
    }
    Log.info(tag: "LOCATION PERMISSION", message: permission == CustomLocationPermission.granted ? "Permission granted" : "Permission denied");
    return permission;
  }

  static Future<void> mediaPermissionRequest() async {
    final PermissionStatus photoStatus = await Permission.photos.status;
    if (photoStatus == PermissionStatus.denied || photoStatus == PermissionStatus.permanentlyDenied) {
      await Permission.photos.request();
    } else {
      Log.info(tag: "STORAGE PERMISSION", message: "Permission already granted");
    }
  }

  static Future<void> requestPermission() async {
    await AppPermission.notificationPermissionRequest();
    String? isFirstTime = await SecureStorage.read(key: LocalStorageKeys.PERMISSION_REQUESTED);
    if (isFirstTime != null) {
      return;
    }
    await SecureStorage.write(key: LocalStorageKeys.PERMISSION_REQUESTED, value: "true");
    await AppPermission.geoLocationPermissionRequest();
    await AppPermission.mediaPermissionRequest();
  }
}
