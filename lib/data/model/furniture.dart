import '../../domain/entity/furniture_entity.dart';

class Furniture extends FurnitureEntity{
  late int id;
  final String name;
  final int manufacter;

  Furniture({required this.id, required this.name, required this.manufacter}): 
    super(id: id, name: name, manufacter: manufacter);

  Map<String, dynamic> toMap(){
    return {'name': name, 'manufacter': manufacter};
  }

  factory Furniture.toFromMap(Map<String, dynamic> json)
  {
    return Furniture(id: json ['id'], name: json ['name'], 
      manufacter: json ['manufacter']);
  }
}
