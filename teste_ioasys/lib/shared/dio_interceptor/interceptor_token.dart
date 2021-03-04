import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/app_controller.dart';
import 'package:teste_ioasys/shared/constants/app_constants.dart';

class InterceptorToken extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    String apiToken = Modular.get<AppController>().apiToken;
    String client = Modular.get<AppController>().client;
    String uid = Modular.get<AppController>().uid;

    options.baseUrl = AppConstants.urlBase;

    options.headers.addAll({
      "ContentType": "application/json",
      "Authorization": 'Bearer $apiToken',
      "client": client,
      "uid": uid,
    });

    return options;
  }
}
