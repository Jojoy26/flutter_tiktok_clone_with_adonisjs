import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageController {

  final FlutterSecureStorage storage;
  FlutterSecureStorageController({
    required this.storage,
  });

  Future saveToken(String token) async {
    await storage.write(key: 'tokenTikTokClone', value: token);
  }

  Future<String?> readToken() async {
    return await storage.read(key: 'tokenTikTokClone');
  }

  Future deleteToken() async {
    await storage.delete(key: 'tokenTikTokClone');
  }
}
