abstract class DatabaseRequest{
  static String deleteTable(String table)=>'DROP TABLE $table';

  static const String tableRole = 'Role'; 
  static const String tableUsers = 'User'; 
  static const String tableProvider = 'Provider';
  static const String tableManufacter = 'Manufacter'; 
  static const String tableFurniture = 'Furniture'; 
  static const String tableWarehouse = 'Warehouse'; 
  static const String tableFurnitureItem = 'FurnitureItem'; 
  static const String tableBuyer = 'Buyer';  
  static const String tableCheque = 'Cheque';
  static const String tableFurnitureItemInCheque = 'FurnitureItemInCheque';

  static const List<String> tableList = [
    tableRole, tableUsers, tableProvider, tableManufacter, tableFurniture, tableWarehouse, tableFurnitureItem,
    tableBuyer, tableCheque, tableFurnitureItemInCheque
  ];

  static const String _createTableRole =
    'CREATE TABLE "$tableRole" ("id" INTEGER, "name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableUsers =
    'CREATE TABLE "$tableUsers" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL, "firstname" TEXT NOT NULL, "lastname" TEXT NOT NULL, "middlename" TEXT ,"id_role" INTEGER,FOREIGN KEY("id_role") REFERENCES "$tableProvider"("id"),  PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableProvider=
    'CREATE TABLE "$tableProvider"( "id" INTEGER , "name" TEXT NOT NULL UNIQUE, "address" TEXT NOT NULL, "email" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableManufacter =
    'CREATE TABLE "$tableManufacter" ("id" INTEGER, "title" TEXT NOT NULL UNIQUE, "discription" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableFurniture =
    'CREATE TABLE "$tableFurniture" ("id" INTEGER, "name" TEXT NOT NULL UNIQUE, "manufacter" INTEGER, FOREIGN KEY("manufacter") REFERENCES "$tableManufacter"("id"), PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableWarehouse =
    'CREATE TABLE "$tableWarehouse" ("id" INTEGER, "address" TEXT NOT NULL) PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableFurnitureItem =
    'CREATE TABLE "$tableFurnitureItem" ("id" INTEGER, "warehouse_number" TEXT NOT NULL UNIQUE, "furniture" INTEGER, "warehouse" INTEGER, FOREIGN KEY("warehouse") REFERENCES "$tableWarehouse"("id"), PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableBuyer =
    'CREATE TABLE "$tableBuyer" ("id" INTEGER, "last_name" TEXT NOT NULL, "first_name" TEXT NOT NULL, "age" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableCheque = 
    'CREATE TABLE "$tableCheque" ("id" INTEGER, "number" TEXT NOT NULL UNIQUE, "print_date" DATE NOT NULL, "employee" INTEGER NOT NULL, "buyer" INTEGER NOT NULL, FOREIGN KEY("employee") REFERENCES "$tableUsers"("id"), FOREIGN KEY("buyer") REFERENCES "$tableBuyer"("id"), PRIMARY KEY("id" AUTOINCREMENT));';
  static const String _createTableFurnitureItemInCheque = 
    'CREATE TABLE "$tableCheque" ("id" INTEGER, "furniture_item" INTEGER NOT NULL, "cheque" INTEGER NOT NULL, FOREIGN KEY("furniture_item") REFERENCES "$tableFurnitureItem"("id"), FOREIGN KEY("cheque") REFERENCES "$tableCheque"("id"), PRIMARY KEY("id" AUTOINCREMENT));';

  static const List<String> tableCreateList = [
    _createTableRole, _createTableUsers, _createTableProvider, _createTableManufacter, _createTableFurniture, _createTableWarehouse,
    _createTableFurnitureItem, _createTableBuyer, _createTableCheque, _createTableFurnitureItemInCheque
  ];
}