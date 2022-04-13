import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tik_tok/src/controllers/create_video_controller.dart';
import 'package:flutter_tik_tok/src/controllers/flutter_secure_storage_controller.dart';
import 'package:flutter_tik_tok/src/controllers/home_controller.dart';
import 'package:flutter_tik_tok/src/controllers/login_controller.dart';
import 'package:flutter_tik_tok/src/controllers/sign_up_controller.dart';
import 'package:flutter_tik_tok/src/controllers/splash_controller.dart';
import 'package:flutter_tik_tok/src/controllers/tiktok_controller.dart';
import 'package:flutter_tik_tok/src/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  
  getIt.registerFactory<FlutterSecureStorage>(() => FlutterSecureStorage());

  getIt.registerFactory<FlutterSecureStorageController>(() => FlutterSecureStorageController(storage: getIt()));
  getIt.registerSingleton<UserController>(UserController(storageController: getIt()));
  getIt.registerFactory<SplashController>(() => SplashController(storageController: getIt(), userController: getIt()));
  getIt.registerFactory<SignUpController>(() => SignUpController());
  getIt.registerFactory<LoginController>(() => LoginController(userController: getIt()));
  getIt.registerSingleton<TikTokController>(TikTokController());
  getIt.registerSingleton<HomeController>(HomeController(userController: getIt()));
  getIt.registerFactory<CreateVideoController>(() => CreateVideoController(userController: getIt()));
}