import 'package:app/routes/routes.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'global/bindings/global_binding.dart';
import 'routes/screens.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      title: 'Flutter Demo',
      initialBinding: GlobalBinding(),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppScreens.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
