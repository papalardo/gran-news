import 'package:app/models/news.dart';

import '../commom_service.dart';
import '../constants.dart';

class NewsService extends CommomService {
  Future<List<NewsModel>> paginated(int page) async {
    var response = await get(EndpointConstants.NEWS_PAGINATED,
        query: {'page': page.toString()});

    List<NewsModel> _list = [];

    List collection = response.body['data'];

    for (var item in collection) {
      _list.add(NewsModel.fromJson(item));
    }

    return _list;
  }
}
