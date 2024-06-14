
import 'package:device_info_plus/device_info_plus.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getDeviceDetails() async {
  // final String? fcmToken = await getFirebaseMessagingToken();
  // print(fcmToken);
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> deviceData = <String, dynamic>{};

  try {
    if (kIsWeb) {
      deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {
      deviceData = switch (defaultTargetPlatform) {
        TargetPlatform.android => _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
        TargetPlatform.iOS => _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
        TargetPlatform.linux => _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
        TargetPlatform.windows => _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
        TargetPlatform.macOS => _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
        TargetPlatform.fuchsia => <String, dynamic>{'Error:': 'Fuchsia platform isn\'t supported'},
      };
    }
  } on PlatformException {
    deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
  }
  Log.info(tag: "DEVICE_INFO", message: {'deviceData': deviceData});
  return deviceData;
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return {'lastLoginDevice': '${build.brand} ${build.model} - Android ${build.version.release}'};
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return {'lastLoginDevice': 'Apple ${data.model} - ${data.systemName} ${data.systemVersion}'};
}

Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  return {'lastLoginDevice': 'Apple ${data.model} - ${data.arch}'};
}

Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  return {'lastLoginDevice': 'Windows ${data.productName}'};
}

Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  return {'lastLoginDevice': data.prettyName};
}

Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  return {'lastLoginDevice': '${data.browserName.name} ${data.appVersion}(${data.platform})'};
}
