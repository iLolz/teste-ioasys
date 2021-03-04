import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import 'login/page/login_controller.dart';
import 'login/page/login_page.dart';
import 'repository/login_repository.dart';
import 'repository/login_repository_impl.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(repository: i.get<LoginRepository>())),
        Bind((i) => LoginRepositoryImplements(dio: i.get<AppController>().dio))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
