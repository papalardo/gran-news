import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}