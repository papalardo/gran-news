import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/services/auth_service/auth_service.dart';
import 'package:app/services/commom_service.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<CommomService>(() => CommomService());
  }
}