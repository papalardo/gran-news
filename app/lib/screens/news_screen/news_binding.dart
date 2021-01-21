import 'package:app/services/news_service/news_service.dart';
import 'package:get/get.dart';

import 'news_controller.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
    Get.put(NewsService());
  }
}
