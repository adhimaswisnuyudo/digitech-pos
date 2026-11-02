import 'package:drift/drift.dart';

import 'categories.dart';

@DataClassName('ProductRow')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get categoryId => text().references(Categories, #id)();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isDemo => boolean().withDefault(const Constant(false))();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get syncedAt => dateTime().nullable()();
  IntColumn get serverRevision => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
