import '../../core/crypto/crypto.dart';
import '../../core/db/database_helper.dart';
import '../../common/database_request.dart';
import '../../core/exception/failure.dart';
import '../../data/model/user.dart';
import '../../domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoriesImpl implements AuthRepositories{
  
  final _db = DatabaseHelper.instance.database;
  @override
  String get table => DatabaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try{
      var user = await _db.query(
        table, 
        columns: ['login', 'password', 'id_role'],
        where: 'login=?', 
        whereArgs: [login]);
      if(user.isEmpty){
        return const Left('Данного пользователя не сущестует');
      }
      if(user.first['password']!=Crypto.crypto(password)){
        return Left(AuthPasswordFailure().errormessage);
      }

      return Right(RoleEnum.values[(user.first['id_role'] as int )-1]);
    } on DatabaseException catch(error){
      return Left(FailureDB(error.getResultCode()!).error.errormessage) ;
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password,  String firstName, String lastName, String middleName) async {
    try{
      var passHes = Crypto.crypto(password);
      _db.insert(
        table,
        User(
         login: login, 
         firstName: firstName,
          lastName: lastName,
           middleName: middleName, 
           password: passHes, 
           id_role: RoleEnum.user.id
           // id_role: RoleEnum.admin.id
      ).toMap());
      //var result = await _db.rawQuery('Select  from $table order by Desc limit 1');
      return const Right(true);
    } on DatabaseException catch(error){ 
      return Left(FailureDB(error.getResultCode()!).error.errormessage);
    }
  }
}