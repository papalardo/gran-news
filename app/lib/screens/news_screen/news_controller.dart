import 'package:app/models/news.dart';
import 'package:app/services/news_service/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  NewsService _newsService = Get.find<NewsService>();

  RxInt currentPage = 1.obs;

  var loading = false.obs;

  List<NewsModel> collection = List<NewsModel>().obs;

  Future<void> getPaginated({int page = 1}) async {
    loading.toggle();

    List<NewsModel> _listModel = await _newsService.paginated(page);

    for (NewsModel item in _listModel) {
      collection.add(item);
    }

    loading.toggle();
  }
}
