import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/models/user.dart';
import 'package:app/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../commom_service.dart';

class AuthService extends CommomService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    var response = await post(
        EndpointConstants.LOGIN, {"email": username, "password": password});

    GetStorage().write('access_token', response.body['access_token']);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Login", content: Text("Login/Senha não confere."));
      return null;
    }
  }

  Future<Map<String, dynamic>> loginWithGoogle(
      {@required String accessToken}) async {
    var response = await post(EndpointConstants.LOGIN_GOOGLE, {
      "token": accessToken,
    });

    GetStorage().write('access_token', response.body['access_token']);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Login", content: Text("Erro ao realizar login com google."));
      return null;
    }
  }

  Future<User> getUser() async {
    Response response = await get(EndpointConstants.AUTH_USER);

    if (response.status.isOk) {
      return User.fromJson(response.body);
    }
    return null;
  }
}
