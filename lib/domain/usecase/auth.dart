import 'package:dartz/dartz.dart';
import '../../core/usercases/auth_user_case.dart';
import '../../domain/entity/role_entity.dart';
import '../../domain/repositories/auth_repositories.dart';

class Auth implements AuthUserCase<String, AuthParams, RegistrationParams> {
  final AuthRepositories authRepositories;

  Auth(this.authRepositories);

  @override
  Future<Either<String, RoleEnum>> signIn(AuthParams params) async {
    return await authRepositories.signIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> signUp(RegistrationParams params) async {
    return await authRepositories.signUp(params.login, params.password, params.firstName, params.lastName, params.middleName);
  }
}

class AuthParams {
  final String login;
  final String password;

  AuthParams({
    required this.login, 
    required this.password,  
  });
}

class RegistrationParams {
  final String login;
  final String password;
  final String firstName;
  final String lastName;
  final String middleName;

  RegistrationParams({ 
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.login, 
    required this.password
  });
}