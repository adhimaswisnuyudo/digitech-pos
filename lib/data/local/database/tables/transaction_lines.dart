import 'package:drift/drift.dart';

import 'products.dart';
import 'transactions.dart';

@DataClassName('TransactionLineRow')
class TransactionLines extends Table {
  TextColumn get id => text()();
  TextColumn get transactionId =>
      text().references(Transactions, #id, onDelete: KeyAction.cascade)();
  TextColumn get productId =>
      text().nullable().references(Products, #id, onDelete: KeyAction.setNull)();
  TextColumn get productNameSnapshot => text()();
  IntColumn get unitPriceSnapshot => integer()();
  IntColumn get qty => integer()();
  IntColumn get lineTotal => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
