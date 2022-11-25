class EmployeeEntity{
  late int id;
  final String email;
  final String login;
  final String password;
  final String lastName;
  final String initials;
  final int role;

  EmployeeEntity({
    required int id, required this.email, required this.login, 
    required this.password, required this.lastName, 
    required this.initials, required this.role
  }); 
}