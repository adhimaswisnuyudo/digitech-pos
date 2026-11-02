import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/application/use_cases/initialize_app.dart';
import 'package:cashier_point_of_sales/data/local/database/app_database.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/catalog_dao.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/settings_dao.dart';
import 'package:cashier_point_of_sales/data/local/seed/demo_seeder.dart';
import 'package:cashier_point_of_sales/data/repositories/settings_repository_impl.dart';

void main() {
  late AppDatabase database;
  late CatalogDao catalogDao;
  late SettingsDao settingsDao;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    catalogDao = CatalogDao(database);
    settingsDao = SettingsDao(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('InitializeApp seeds demo menu on empty database', () async {
    final initializeApp = InitializeApp(
      settingsRepository: SettingsRepositoryImpl(settingsDao),
      demoSeeder: DemoSeeder(
        database: database,
        catalogDao: catalogDao,
        settingsDao: settingsDao,
      ),
    );

    await initializeApp();

    expect(await catalogDao.countCategories(), 2);
    expect(await catalogDao.countProducts(), 6);

    final settings = await settingsDao.getSettings();
    expect(settings?.dbSeededAt, isA<DateTime>());
  });
}
