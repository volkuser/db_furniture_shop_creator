import '../../entity/cheque_entity.dart';

class Cheque extends ChequeEntity{
  late int id;
  final String number;
  final DateTime printDate;
  final int employee;
  final int buyer;

  Cheque({required this.id, required this.number, 
    required this.printDate, required this.employee, required this.buyer}): 
    super(id: id, number: number, printDate: printDate, employee: employee, buyer: buyer);

  Map<String, dynamic> toMap(){
    return {'number': number, 'printDate': printDate, 
      'employee': employee, 'buyer': buyer};
  }

  factory Cheque.toFromMap(Map<String, dynamic> json)
  {
    return Cheque(id: json ['id'], number: json ['number'], 
      printDate: json ['printDate'], employee: json ['employee'], 
      buyer: json ['buyer']);
  }
}
