import 'package:dio/dio.dart';

import '../../../../shared/dio_interceptor/custom_dio.dart';
import 'login_repository.dart';

class LoginRepositoryImplements extends LoginRepository {
  final CustomDio dio;

  LoginRepositoryImplements({this.dio});

  @override
  Future<Response> login({String email, String password}) {
    return dio.post("/users/auth/sign_in",
        queryParameters: {"email": email, "password": password});
  }
}
