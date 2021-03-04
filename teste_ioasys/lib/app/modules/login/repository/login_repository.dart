import 'package:dio/dio.dart';

abstract class LoginRepository {
  Future<Response> login({String email, String password});
}
