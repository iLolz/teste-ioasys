import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ioasys/shared/dio_interceptor/custom_dio.dart';
import 'package:teste_ioasys/shared/models/investor.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  CustomDio dio = CustomDio();
  Investor investor;
  String apiToken = "";
  String client;
  String uid;
}
