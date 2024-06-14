import 'package:edudoor_jobseeker/src/helper/device_helper.dart';
import 'package:edudoor_jobseeker/src/notification_handlers/notification_service.dart';
import 'package:edudoor_jobseeker/src/services/web_socket/socket.dart';
import 'package:edudoor_jobseeker/src/services/web_socket/socket_events.dart';

class SocketEmit {
  static void sendDeviceInfo() async {
    final Map<String, dynamic> deviceInfo = await getDeviceDetails();
    deviceInfo['firebaseToken'] = await NotificationService.getDeviceToken();
    SocketService.socket!.emit(
      SocketEvent.DEVICE_INFO,
      deviceInfo,
    );
  }
}
