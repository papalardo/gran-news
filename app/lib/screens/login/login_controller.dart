import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _authController = Get.find<AuthController>();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl =
      TextEditingController(text: 'teste@teste.com');
  TextEditingController passwordCtrl = TextEditingController(text: 'p@ssw0rd');

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void login() async {
    if (formKey.currentState.validate()) {
      try {
        loading.value = true;
        Map<String, dynamic> auth = await _authController.login(
            username: usernameCtrl.text, password: passwordCtrl.text);

        if (auth != null) {
          Get.offAllNamed(AppRoutes.LAYOUT);
        }
      } catch (err) {} finally {
        loading.value = false;
      }
    }
  }

  void toRegister() {
    Get.offAndToNamed(AppRoutes.INITIAL);
  }

  Future<void> signInGoogle() async {
    try {
      GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication _autentication = await _googleAccount.authentication;
      await _authController.loginWithGoogle(accessToken: _autentication.accessToken);

      Get.offAllNamed(AppRoutes.LAYOUT);

    } catch (error) {
      print(error);
    }
  }
}
