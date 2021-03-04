import 'package:dio/dio.dart';
import 'package:teste_ioasys/app/modules/home/repository/home_repository.dart';
import 'package:teste_ioasys/shared/dio_interceptor/custom_dio.dart';

class HomeRepositoryImplements extends HomeRepository {
  final CustomDio dio;

  HomeRepositoryImplements({this.dio});

  @override
  Future<Response> getEnterprises({int type, String name}) async {
    return await dio.get("/enterprises",
        queryParameters: {"enterprise_types": type, "name": name});
  }

  @override
  Future<Response> getEnterprisesWithFilter({int type, String name}) async {
    return await dio.get("/enterprises",
        queryParameters: {"enterprise_types": type, "name": name});
  }

  @override
  Future<Response> showEnterprise() async {
    return await dio.get("/enterprises/1");
  }
}
