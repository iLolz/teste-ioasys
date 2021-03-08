import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ioasys/app/app_status.dart';

import '../../../../../shared/models/investor.dart';
import '../../../../app_controller.dart';
import '../../repository/login_repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;

  _LoginControllerBase({this.repository});

  @observable
  AppStatus appStatus = AppStatus.none;

  @observable
  bool passwordVisibility = true;

  @observable
  String errorMessage;

  @computed
  bool get hasError => (errorMessage?.isNotEmpty ?? false);

  @action
  void setStatus({AppStatus status}) => appStatus = status;

  @action
  void resetErrorMessage() => errorMessage = null;

  @action
  Future<void> login({String email, String password}) async {
    appStatus = AppStatus.loading;

    final response = await _login(email: email, password: password);

    if (response == AppStatus.error) {
      errorMessage = response.message;
      appStatus = AppStatus.none;
    } else {
      appStatus = response;
    }
  }

  @action
  bool changeObscure() => passwordVisibility = !passwordVisibility;

  Future<AppStatus> _login({String email, String password}) async {
    try {
      final response = await repository.login(email: email, password: password);

      if (response.statusCode == 200) {
        Investor investor = Investor.fromJson(response.data["investor"]);
        String apiToken = response.headers.map['access-token'][0];
        String uid = response.headers.map['uid'][0].toString();
        String client = response.headers.map['client'][0].toString();

        Modular.get<AppController>()
          ..investor = investor
          ..apiToken = apiToken
          ..uid = uid
          ..client = client;
        return AppStatus.success;
      }
      return AppStatus.success;
    } on DioError catch (e) {
      return AppStatus.error..message = e.response.data['errors'][0];
    } on PlatformException catch (e) {
      return AppStatus.error..message = e.message;
    } catch (e) {
      return AppStatus.error..message = e.toString();
    }
  }
}
