import 'dart:async';

import 'package:app/services/constants.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class CommomService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL + '/';
    httpClient.addRequestModifier(_requestModifier);
  }

  FutureOr<Request> _requestModifier(request) {
    request.headers['Accept'] = 'application/json';
    request.headers['Content-type'] = 'application/json';

    String accessToken = GetStorage().read('access_token');
    if (accessToken != null) {
      request.headers['Authorization'] = "Bearer $accessToken";
    }
    return request;
  }
}
