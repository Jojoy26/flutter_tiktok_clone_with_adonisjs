import 'package:flutter_tik_tok/src/controllers/flutter_secure_storage_controller.dart';
import 'package:flutter_tik_tok/src/models/user_model.dart';

class UserController {

  final FlutterSecureStorageController storageController;
  UserController({
    required this.storageController,
  });

  UserModel user = UserModel(token: '');

  Future setToken(String token) async {
    user.token = token;
    await storageController.saveToken(token);
  }
}
