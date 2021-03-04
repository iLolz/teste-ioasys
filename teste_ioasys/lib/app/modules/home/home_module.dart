import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository_impl.dart';

import '../../app_controller.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(homeRepository: i.get<HomeRepository>())),
        Bind((i) => HomeRepositoryImplements(dio: i.get<AppController>().dio))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
