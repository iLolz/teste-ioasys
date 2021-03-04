import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/models/investor.dart';
import '../../../../app_controller.dart';
import '../../repository/login_repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;

  _LoginControllerBase({this.repository});

  Future<void> login({String email, String password}) async {
    try {
      final response = await repository.login(email: email, password: password);

      if (response.statusCode == 200) {
        Investor investor = Investor.fromJson(response.data["investor"]);
        String apiToken = response.headers.map['accessToken'].toString();
        String uid = response.headers.map['uid'].toString();
        String client = response.headers.map['client'].toString();

        Modular.get<AppController>()
          ..investor = investor
          ..apiToken = apiToken
          ..uid = uid
          ..client = client;
      }
    } on DioError catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
