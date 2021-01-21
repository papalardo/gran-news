import 'package:app/screens/events_screen/events_binding.dart';
import 'package:app/screens/events_screen/events_controller.dart';
import 'package:app/screens/news_screen/news_binding.dart';
import 'package:app/screens/news_screen/news_controller.dart';
import 'package:get/get.dart';

import 'main_layout_controller.dart';

class MainLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    NewsBinding().dependencies();
    EventsBinding().dependencies();
  }
}
