import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/shared/dio_interceptor/custom_dio.dart';

import '../../app_controller.dart';
import 'login/page/login_controller.dart';
import 'repository/login_repository.dart';
import 'repository/login_repository_impl.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(repository: i.get<LoginRepository>())),
        Bind((i) => LoginRepositoryImplements(dio: i.get<AppController>().dio))
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<LoginModule>.of();
}
