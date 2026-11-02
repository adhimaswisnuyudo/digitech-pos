import 'package:drift/drift.dart';

@DataClassName('TransactionRow')
class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get displayNumber => text().unique()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get orderType => text()();
  TextColumn get status => text()();
  DateTimeColumn get voidedAt => dateTime().nullable()();
  IntColumn get subtotal => integer()();
  IntColumn get total => integer()();
  TextColumn get paymentMethod => text()();
  IntColumn get amountPaid => integer()();
  IntColumn get changeAmount => integer()();
  DateTimeColumn get syncedAt => dateTime().nullable()();
  IntColumn get serverRevision => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
