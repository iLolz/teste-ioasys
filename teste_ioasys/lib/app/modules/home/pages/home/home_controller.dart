import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/app_status.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository.dart';
import 'package:teste_ioasys/shared/models/enterprises.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase({this.repository});

  @observable
  AppStatus appStatus = AppStatus.none;

  List<Company> companies = List<Company>();

  @action
  Future<void> getEnterprises() async {
    appStatus = AppStatus.loading;

    try {
      final response = await _getEnterprises();

      companies.clear();

      if (response.isNotEmpty) {
        companies.addAll(response);
      }

      appStatus = AppStatus.success;
    } on DioError catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Company>> _getEnterprises() async {
    final response = await repository.getEnterprises();
    final List localCompanies = List<Company>();
    companies.clear();

    if (response.data.containsKey("enterprises") &&
        response.data["enterprises"].isNotEmpty) {
      response.data["enterprises"].forEach((e) {
        localCompanies.add(Company.fromMap(e));
      });
    }

    return localCompanies;
  }
}
