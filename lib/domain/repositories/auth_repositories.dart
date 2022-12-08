import 'package:furniture_shop_db_editor/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories{
  String get table; 
  Future<Either<String, RoleEnum>>  signIn(String login, String password, ); // доб
  Future <Either<String, bool>> signUp(String login, String password, String firstName, String lastName, String middleName);
}