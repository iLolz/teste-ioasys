import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'view_company_controller.g.dart';

@Injectable()
class ViewCompanyController = _ViewCompanyControllerBase
    with _$ViewCompanyController;

abstract class _ViewCompanyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
