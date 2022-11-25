import '../../entity/manufacter_entity.dart';

class Manufacter extends ManufacterEntity{
  late int id;
  final String title;
  final String discription;

  Manufacter({required this.id, required this.title, required this.discription}): 
    super(id: id, title: title, discription: discription);

  Map<String, dynamic> toMap(){
    return {'title': title, 'discription': discription};
  }

  factory Manufacter.toFromMap(Map<String, dynamic> json)
  {
    return Manufacter(id: json ['id'], title: json ['title'], 
      discription: json ['discription']);
  }
}
