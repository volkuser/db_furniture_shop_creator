class RoleEntity{
  late int id;
  final String name;

  RoleEntity({required this.id, required this.name});  
}

enum RoleEnum {
  admin(id:1, name: 'Адмиистратор'),
  user(id:2, name: 'Пользователь');

  const RoleEnum({
    required this.name,
    required this.id
  });

  final String name;
  final int id;
}