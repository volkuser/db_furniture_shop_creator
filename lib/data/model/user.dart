import '../../domain/entity/user_entity.dart';

class User extends UserEntity{
late int id;
final String login;
final String firstName;
final String lastName;
final String middleName;
final String password;
final int id_role;

  User({
     this.id=0,
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.password,
    required this.id_role
    }): super(
      id: id,
      login: login, 
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      password: password,
      id_role: id_role
    );

  Map<String, dynamic> toMap(){
    return {
      'login':login, 
      'firstName':firstName,
      'lastName':lastName,
      'middleName':middleName, 
      'password':password, 
      'id_role':id_role
      };
  }

  factory User.toFromMap(Map<String, dynamic> json)
  {
    return User(
      id: json ['id'],
      login: json ['role'],
      firstName:json ['firstName'],
      lastName:json ['lastName'],
      middleName:json ['middleName'],
      password:json ['password'],
      id_role:json['id_role']
      );
  }
}