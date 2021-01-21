import 'package:app/services/events_service/events_service.dart';
import 'package:get/get.dart';

import 'events_controller.dart';

class EventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsController>(() => EventsController());
    Get.put(EventsService());
  }
}