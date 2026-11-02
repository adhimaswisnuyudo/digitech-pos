import 'package:drift/drift.dart';

import 'daos/catalog_dao.dart';
import 'daos/settings_dao.dart';
import 'tables/app_settings_table.dart';
import 'tables/categories.dart';
import 'tables/products.dart';
import 'tables/schema_meta.dart';
import 'tables/transaction_lines.dart';
import 'tables/transactions.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    Products,
    Transactions,
    TransactionLines,
    AppSettingsTable,
    SchemaMeta,
  ],
  daos: [CatalogDao, SettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.addColumn(
              appSettingsTable,
              appSettingsTable.themeMode,
            );
          }
          if (from < 3) {
            await migrator.addColumn(products, products.imagePath);
          }
        },
      );
}
