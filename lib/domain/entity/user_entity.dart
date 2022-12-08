class UserEntity{
  late int id;
  final String login;
  final String firstName;
  final String lastName;
  final String middleName;
  final String password;
  final int id_role;
  
  UserEntity({
    required this.id,
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.id_role,
    required this.password,
    });
}