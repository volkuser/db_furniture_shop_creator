import '../../entity/warehouse_entity.dart';

class Warehouse extends WarehouseEntity{
  late int id;
  final String address;

  Warehouse({required this.id, required this.address}): super(id: id, address: address);

  Map<String, dynamic> toMap(){
    return {'address': address};
  }

  factory Warehouse.toFromMap(Map<String, dynamic> json)
  {
    return Warehouse(id: json ['id'], address: json ['address']);
  }
}
