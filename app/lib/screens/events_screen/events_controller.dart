import 'package:app/models/event.dart';
import 'package:app/services/events_service/events_service.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  EventsService _eventsService = Get.find<EventsService>();
  RxInt currentPage = 1.obs;
  var loading = false.obs;
  List<EventModel> collection = List<EventModel>().obs;


  Future<void> getPaginated({int page = 1}) async {
    loading.toggle();

    List<EventModel> _listModel = await _eventsService.paginated(page);

    for (EventModel item in _listModel) {
      collection.add(item);
    }

    loading.toggle();
  }
}
