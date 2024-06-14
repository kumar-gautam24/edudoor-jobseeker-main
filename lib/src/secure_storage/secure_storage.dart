import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static Future<void> write({required String key, required String value}) async {
    Log.info(tag: "SECURE_STORAGE_WRITE", message: "Writing to secure storage key: $key, value: $value");
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read({required String key}) async {
    Log.info(tag: "SECURE_STORAGE_READ", message: "Reading from secure storage key: $key");
    return await _storage.read(key: key);
  }

  static Future<void> delete({required String key}) async {
    Log.info(tag: "SECURE_STORAGE_DELETE", message: "Deleting from secure storage key: $key");
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    Log.info(tag: "SECURE_STORAGE_DELETE_ALL", message: "Deleting all from secure storage");
    await _storage.deleteAll();
  }

  static Future<Map<String, String>> readAll() async {
    Log.info(tag: "SECURE_STORAGE_READ_ALL", message: "Reading all from secure storage");
    return await _storage.readAll();
  }
}
