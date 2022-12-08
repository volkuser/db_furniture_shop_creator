import '../../domain/entity/furniture_item_in_cheque_entity.dart';

class FurnitureItemInCheque extends FurnitureItemInChequeEntity{
  late int id;
  final int furniture_item;
  final int cheque;

  FurnitureItemInCheque({required this.id, required this.furniture_item, required this.cheque}): 
    super(id: id, furniture_item: furniture_item, cheque: cheque);

  Map<String, dynamic> toMap(){
    return {'furniture_item': furniture_item, 'cheque': cheque};
  }

  factory FurnitureItemInCheque.toFromMap(Map<String, dynamic> json)
  {
    return FurnitureItemInCheque(id: json ['id'], furniture_item: json ['furniture_item'], 
      cheque: json ['cheque']);
  }
}
