import '../../domain/entity/furniture_item_entity.dart';

class FirnitureItem extends FirnitureItemEntity{
  late int id;
  final String warehouseNumber;
  final int warehouse;
  final int furniture;

  FirnitureItem({required this.id, required this.warehouseNumber, 
    required this.warehouse, required this.furniture}): 
    super(id: id, warehouseNumber: warehouseNumber, 
    warehouse: warehouse, furniture: furniture);

  Map<String, dynamic> toMap(){
    return {'warehouseNumber': warehouseNumber, 'warehouse': warehouse, 
      'furniture': furniture};
  }

  factory FirnitureItem.toFromMap(Map<String, dynamic> json)
  {
    return FirnitureItem(id: json ['id'], warehouseNumber: json ['warehouseNumber'], 
      warehouse: json ['warehouse'], furniture: json ['furniture']);
  }
}
