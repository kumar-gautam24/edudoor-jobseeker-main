import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/secure_storage/local_storage_keys.dart';
import 'package:edudoor_jobseeker/src/secure_storage/secure_storage.dart';
import 'package:edudoor_jobseeker/src/services/web_socket/socket_emit.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static io.Socket? socket;

  static void connectAndListen() async {
    final accessToken = await SecureStorage.read(key: LocalStorageKeys.ACCESS_TOKEN);
    disconnect();
    String socketUrl = 'http://20.197.55.201:3000/socker-service';
    socket = io.io(
      socketUrl,
      io.OptionBuilder()
          .enableForceNew()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({
            'Authorization': 'Bearer $accessToken',
          })
          .setReconnectionAttempts(3)
          .build(),
    );
    socket!.connect();
    socket!.onConnect((_) async {
      Log.info(tag: "SOCKET_CONNECTED", message: "Socket connected successfully with $socketUrl and phone number ${AllBloc.authenticationBloc.jobseekerModel?.phone}");

      SocketEmit.sendDeviceInfo();

      socket!.onDisconnect((_) => Log.info(
          tag: "SOCKET_DISCONNECTED", message: "Socket disconnected successfully with $socketUrl and phone number ${AllBloc.authenticationBloc.jobseekerModel?.phone}"));
    });
  }

  static void disconnect() {
    if (socket != null) {
      if (socket!.connected) {
        socket!.disconnect();
      }
    }
  }
}
