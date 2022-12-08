
import '../../domain/entity/provider_entity.dart';

class Provider extends ProviderEntity{
  late int id;
  final String address;
  final String name;
  final String number;

  Provider({required this.id, required this.address, required this.name, required this.number}) 
    :super(id: id, address: address, name:name, number:number);

  Map<String, dynamic> toMap(){
    return {'address':address, 'name':name, 'number':number};
  }

  factory Provider.toFromMap(Map<String, dynamic> json)
  {
    return Provider(id: json ['id'],address: json ['address'], name: json ['name'], number: json ['number'] );
  }
}