import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/application/use_cases/delete_demo_products.dart';
import 'package:cashier_point_of_sales/application/use_cases/update_theme_mode.dart';
import 'package:cashier_point_of_sales/application/use_cases/update_settings.dart';
import 'package:cashier_point_of_sales/domain/enums/app_theme_preference.dart';
import 'package:cashier_point_of_sales/data/local/database/app_database.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/catalog_dao.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/settings_dao.dart';
import 'package:cashier_point_of_sales/data/repositories/product_repository_impl.dart';
import 'package:cashier_point_of_sales/data/repositories/settings_repository_impl.dart';

void main() {
  late AppDatabase database;
  late CatalogDao catalogDao;
  late SettingsDao settingsDao;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    catalogDao = CatalogDao(database);
    settingsDao = SettingsDao(database);
    await settingsDao.ensureDefaultSettings(DateTime.now().toUtc());
  });

  tearDown(() async {
    await database.close();
  });

  test('UpdateSettings persists outlet and footer', () async {
    final repo = SettingsRepositoryImpl(settingsDao);
    final updateSettings = UpdateSettings(repo);

    await updateSettings.call(
      outletName: 'Warung Test',
      receiptFooter: 'Terima kasih',
    );

    final settings = await repo.getSettings();
    expect(settings.outletName, 'Warung Test');
    expect(settings.receiptFooter, 'Terima kasih');
  });

  test('UpdateSettings rejects empty outlet name', () async {
    final updateSettings = UpdateSettings(SettingsRepositoryImpl(settingsDao));

    expect(
      () => updateSettings.call(outletName: '   '),
      throwsArgumentError,
    );
  });

  test('UpdateThemeMode persists preference', () async {
    final repo = SettingsRepositoryImpl(settingsDao);
    final updateTheme = UpdateThemeMode(repo);

    await updateTheme.call(AppThemePreference.dark);

    final settings = await repo.getSettings();
    expect(settings.themeMode, AppThemePreference.dark);
  });

  test('DeleteDemoProducts removes only demo rows', () async {
    final now = DateTime.now().toUtc();
    await catalogDao.insertCategory(
      CategoriesCompanion.insert(
        id: 'cat-1',
        name: 'Minuman',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await catalogDao.insertProduct(
      ProductsCompanion.insert(
        id: 'demo-1',
        categoryId: 'cat-1',
        name: 'Demo Item',
        price: 10000,
        isDemo: const Value(true),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await catalogDao.insertProduct(
      ProductsCompanion.insert(
        id: 'real-1',
        categoryId: 'cat-1',
        name: 'Real Item',
        price: 15000,
        isDemo: const Value(false),
        createdAt: now,
        updatedAt: now,
      ),
    );

    final deleteDemo = DeleteDemoProducts(ProductRepositoryImpl(catalogDao));
    final deleted = await deleteDemo.call();

    expect(deleted, 1);
    expect(await catalogDao.countProducts(), 1);
    expect(await catalogDao.countDemoProducts(), 0);
  });
}
