import '../../entity/employee_entity.dart';

class Employee extends EmployeeEntity{
  late int id;
  final String email;
  final String login;
  final String password;
  final String lastName;
  final String initials;
  final int role;

  Employee({required this.id, required this.email, required this.login, 
    required this.password, required this.lastName, 
    required this.initials, required this.role}): 
    super(id: id, email: email, login: login, password: password, 
      lastName: lastName, initials: initials, role: role);

  Map<String, dynamic> toMap(){
    return {'email': email, 'login': login, 'password': password, 
      'lastName': lastName, 'initials': initials, 'role': role};
  }

  factory Employee.toFromMap(Map<String, dynamic> json)
  {
    return Employee(id: json ['id'], email: json ['email'], login: json ['login'],
      password: json ['password'], lastName: json ['lastName'], 
      initials: json ['initials'], role: json ['role']);
  }
}
