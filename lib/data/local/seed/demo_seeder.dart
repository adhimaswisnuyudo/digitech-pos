import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database/app_database.dart';
import '../database/daos/catalog_dao.dart';
import '../database/daos/settings_dao.dart';

class DemoSeeder {
  DemoSeeder({
    required this.database,
    required this.catalogDao,
    required this.settingsDao,
    Uuid? uuid,
  }) : _uuid = uuid ?? const Uuid();

  final AppDatabase database;
  final CatalogDao catalogDao;
  final SettingsDao settingsDao;
  final Uuid _uuid;

  Future<void> seedIfEmpty() async {
    final categoryCount = await catalogDao.countCategories();
    if (categoryCount > 0) {
      return;
    }

    final now = DateTime.now().toUtc();
    final minumanId = _uuid.v4();
    final makananId = _uuid.v4();

    await database.transaction(() async {
      await catalogDao.insertCategory(
        CategoriesCompanion.insert(
          id: minumanId,
          name: 'Minuman',
          sortOrder: const Value(0),
          createdAt: now,
          updatedAt: now,
        ),
      );
      await catalogDao.insertCategory(
        CategoriesCompanion.insert(
          id: makananId,
          name: 'Makanan',
          sortOrder: const Value(1),
          createdAt: now,
          updatedAt: now,
        ),
      );

      final demoProducts = <({String name, String categoryId, int price})>[
        (name: 'Kopi Susu', categoryId: minumanId, price: 18000),
        (name: 'Teh Manis', categoryId: minumanId, price: 12000),
        (name: 'Es Jeruk', categoryId: minumanId, price: 15000),
        (name: 'Nasi Goreng', categoryId: makananId, price: 25000),
        (name: 'Mie Goreng', categoryId: makananId, price: 22000),
        (name: 'Kentang Goreng', categoryId: makananId, price: 18000),
      ];

      for (final item in demoProducts) {
        await catalogDao.insertProduct(
          ProductsCompanion.insert(
            id: _uuid.v4(),
            categoryId: item.categoryId,
            name: item.name,
            price: item.price,
            isActive: const Value(true),
            isDemo: const Value(true),
            createdAt: now,
            updatedAt: now,
          ),
        );
      }

      await settingsDao.markDbSeeded(now);
    });
  }
}
