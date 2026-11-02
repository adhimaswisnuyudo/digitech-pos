import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/initialize_app.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/database/connection.dart';
import '../../data/local/database/daos/catalog_dao.dart';
import '../../data/local/database/daos/settings_dao.dart';
import '../../data/local/seed/demo_seeder.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/repositories/settings_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = ref.watch(appDatabaseFutureProvider).requireValue;
  ref.onDispose(db.close);
  return db;
});

final appDatabaseFutureProvider = FutureProvider<AppDatabase>((ref) async {
  return AppDatabase(openConnection());
});

final catalogDaoProvider = Provider<CatalogDao>((ref) {
  return CatalogDao(ref.watch(appDatabaseProvider));
});

final settingsDaoProvider = Provider<SettingsDao>((ref) {
  return SettingsDao(ref.watch(appDatabaseProvider));
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(ref.watch(catalogDaoProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(catalogDaoProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(ref.watch(settingsDaoProvider));
});

final demoSeederProvider = Provider<DemoSeeder>((ref) {
  return DemoSeeder(
    database: ref.watch(appDatabaseProvider),
    catalogDao: ref.watch(catalogDaoProvider),
    settingsDao: ref.watch(settingsDaoProvider),
  );
});

final initializeAppProvider = FutureProvider<void>((ref) async {
  await ref.watch(appDatabaseFutureProvider.future);
  final initializeApp = InitializeApp(
    settingsRepository: ref.watch(settingsRepositoryProvider),
    demoSeeder: ref.watch(demoSeederProvider),
  );
  await initializeApp();
});

final productCountProvider = StreamProvider<int>((ref) async* {
  await ref.watch(initializeAppProvider.future);
  final repo = ref.watch(productRepositoryProvider);
  await for (final products in repo.watchAllProducts()) {
    yield products.length;
  }
});

final categoryCountProvider = FutureProvider<int>((ref) async {
  await ref.watch(initializeAppProvider.future);
  return ref.watch(categoryRepositoryProvider).countCategories();
});
