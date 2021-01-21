import 'package:app/screens/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Entrar",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Get.height * 0.03),
                  CupertinoTextField(
                    padding: EdgeInsets.all(10.0),
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    placeholder: "Email",
                    controller: controller.usernameCtrl,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: Get.height * 0.01),
                  CupertinoTextField(
                    padding: EdgeInsets.all(10.0),
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    placeholder: "Password",
                    controller: controller.passwordCtrl,
                    onChanged: (value) {},
                    obscureText: true,
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Obx(
                    () => Visibility(
                      visible: !controller.loading.value,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.amber[800])),
                        onPressed: controller.login,
                        textColor: Colors.white,
                        child: Text("Entrar".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.loading.value,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: Get.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 40,
                            ),
                            onPressed: null,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  FlatButton(
                    child: Text("Login com gogole"),
                    onPressed: () {
                      controller.signInGoogle();
                    },
                  )
                  // AlreadyHaveAnAccountCheck(
                  //   press: () {
                  //     controller.toRegister();
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
