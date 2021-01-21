import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/routes/routes.dart';
import 'package:app/routes/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import 'initial_controller.dart';

class InitialScreen extends StatelessWidget {
  final controller = Get.find<InitialController>();
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            image: Image.asset('assets/images/logo_g.png'),
            photoSize: Get.width * 0.6,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.redAccent,
              ],
            ),
            navigateAfterFuture: fetchUser(),
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(100),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/logo.png"),
            //     fit: BoxFit.contain,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  Future<String> fetchUser() async {
    await _authController.getUser();

    Get.offAllNamed(AppScreens.INITIAL);

    return Future.value(AppScreens.INITIAL);
  }
}
