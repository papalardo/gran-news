import 'package:app/models/user.dart';
import 'package:app/services/auth_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _service = Get.find<AuthService>();

  // Usuário logado
  User user;

  String accessToken;

  final check = false.obs;

  Future<Map<String, dynamic>> login(
      {@required String username, @required String password}) async {
    Map<String, dynamic> auth = await _service.login(username, password);
    user = User.fromJson(auth['user']);
    check.value = true;
    accessToken = auth['access_token'];

    return auth;
  }

  Future<Map<String, dynamic>> loginWithGoogle(
      {@required String accessToken}) async {
    Map<String, dynamic> auth =
        await _service.loginWithGoogle(accessToken: accessToken);
    user = User.fromJson(auth['user']);
    check.value = true;
    accessToken = auth['access_token'];

    return auth;
  }

  Future<User> getUser() async {
    try {
      User _user = await _service.getUser();
      if (_user == null) {
        await logout();
        return null;
      }
      user = _user;
      check.value = true;
      return _user;

    } catch (error) {
      return null;
    }
  }

  Future<User> logout() async {
    user = null;
    check.value = false;
    await GetStorage().remove('access_token');
  }
}
