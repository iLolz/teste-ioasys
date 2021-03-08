import 'package:teste_ioasys/app/modules/home/pages/view_company/view_company_page.dart';

import 'pages/view_company/view_company_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository_impl.dart';

import '../../app_controller.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ViewCompanyController()),
        Bind((i) => HomeController(repository: i.get<HomeRepository>())),
        Bind((i) => HomeRepositoryImplements(dio: i.get<AppController>().dio))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => HomePage()),
        ModularRouter("/view_company",
            child: (_, args) => ViewCompanyPage(
                  company: args.data,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
