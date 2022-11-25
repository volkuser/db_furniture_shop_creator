class ChequeEntity{
  late int id;
  final String number;
  final DateTime printDate;
  final int employee;
  final int buyer;
  
  ChequeEntity({
    required this.id, required this.number,  required this.printDate,
     required this.employee,  required this.buyer 
  });
}