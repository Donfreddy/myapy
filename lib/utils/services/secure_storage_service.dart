// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// /// We do not store user credentials, API tokens, secret API keys in local storage,
// /// for that we make use of flutter_secure_storage which stores data in the Android
// /// Keystore and Apple keychain with platform-specific encryption technique.
// /// In this file, there will be getters and setters for each and every data to be
// /// stored in platform secure storage.

// class SecureStorageService {
//   final storage = const FlutterSecureStorage();

//   Future<Map<String, String>> readAllValues() async {
//     final _result = await storage.readAll();
//     return _result;
//   }

//   Future<String?> read({required String key}) async {
//     final _result = await storage.read(key: key);
//     return _result;
//   }

//   Future<void> write({required String key, required String value}) async {
//     await storage.write(key: key, value: value);
//   }

//   Future<void> deleteAll() async {
//     await storage.deleteAll();
//   }

//   Future<void> delete({required String key}) async {
//     await storage.delete(key: key);
//   }
// }
