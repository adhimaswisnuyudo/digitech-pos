import 'package:drift/drift.dart';

@DataClassName('AppSettingsRow')
class AppSettingsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get outletName =>
      text().withDefault(const Constant('Outlet Saya'))();
  TextColumn get receiptFooter => text().nullable()();
  TextColumn get themeMode => text().withDefault(const Constant('light'))();
  DateTimeColumn get dbSeededAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
