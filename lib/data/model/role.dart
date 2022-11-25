import '../../entity/role_entity.dart';

class Role extends RoleEntity{
  late int id;
  final String name;

  Role({required this.id, required this.name}): super(id: id, name: name);

  Map<String, dynamic> toMap(){
    return {'name': name};
  }

  factory Role.toFromMap(Map<String, dynamic> json)
  {
    return Role(id: json ['id'], name: json ['name']);
  }
}
