import 'package:dio/dio.dart';

abstract class HomeRepository {
  Future<Response> getEnterprises({int type, String name});
  Future<Response> getEnterprisesWithFilter({int type, String name});
  Future<Response> showEnterprise();
}
