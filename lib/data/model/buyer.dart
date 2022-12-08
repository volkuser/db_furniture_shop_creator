import '../../domain/entity/buyer_entity.dart';

class Buyer extends BuyerEntity{
  late int id;
  final String lastName;
  final String firstName;
  final int age;

  Buyer({required this.id, required this.lastName, 
    required this.firstName, required this.age}): 
    super(id: id, lastName: lastName, 
    firstName: firstName, age: age);

  Map<String, dynamic> toMap(){
    return {'lastName': lastName, 'firstName': firstName, 
      'age': age};
  }

  factory Buyer.toFromMap(Map<String, dynamic> json)
  {
    return Buyer(id: json ['id'], lastName: json ['lastName'], 
      firstName: json ['firstName'], age: json ['age']);
  }
}
