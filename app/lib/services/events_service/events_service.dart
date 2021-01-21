import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

import '../commom_service.dart';
import '../constants.dart';

class EventsService extends CommomService {

  Future<List<EventModel>> paginated(int page) async {
    List<EventModel> _list = [];

    try {
      Response<dynamic> _response = await get(EndpointConstants.EVENTS_PAGINATED,
          query: {"page": page.toString()});

      if (_response.status.isOk) {
        List collection = _response.body['data'] ?? [];

        for (var item in collection) {
          _list.add(EventModel.fromJson(item));
        }

        return _list;
      } else if (_response.status.isUnauthorized) {
        return [];
      } else if (_response.status.connectionError) {
        throw 'Erro ao conectar aos nossos servidores';
      } else {
        throw 'Error ao buscar a lista de eventos';
      }
    } catch (error) {
      Get.snackbar('Problema ao buscar os dados.', error.toString(),
          duration: Duration(seconds: 5), backgroundColor: Colors.red);
      return _list;
    }
  }
}
