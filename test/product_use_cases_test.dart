import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/application/use_cases/create_product.dart';
import 'package:cashier_point_of_sales/application/use_cases/delete_product.dart';
import 'package:cashier_point_of_sales/application/use_cases/set_product_active.dart';
import 'package:cashier_point_of_sales/data/local/database/app_database.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/catalog_dao.dart';
import 'package:cashier_point_of_sales/data/repositories/product_repository_impl.dart';

void main() {
  late AppDatabase database;
  late CatalogDao catalogDao;
  late ProductRepositoryImpl repository;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    catalogDao = CatalogDao(database);
    repository = ProductRepositoryImpl(catalogDao);
    final now = DateTime.now().toUtc();
    await catalogDao.insertCategory(
      CategoriesCompanion.insert(
        id: 'cat-1',
        name: 'Minuman',
        createdAt: now,
        updatedAt: now,
      ),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test('CreateProduct stores imagePath', () async {
    final product = await CreateProduct(repository).call(
      name: 'Kopi',
      price: 18000,
      categoryId: 'cat-1',
      isActive: true,
      imagePath: 'product_images/test.jpg',
      id: 'prod-1',
    );

    expect(product.imagePath, 'product_images/test.jpg');
    final loaded = await repository.getProductById('prod-1');
    expect(loaded?.name, 'Kopi');
  });

  test('SetProductActive updates flag', () async {
    final product = await CreateProduct(repository).call(
      name: 'Juice',
      price: 15000,
      categoryId: 'cat-1',
      isActive: true,
      id: 'prod-3',
    );
    await SetProductActive(repository).call(id: product.id, isActive: false);
    final loaded = await repository.getProductById(product.id);
    expect(loaded?.isActive, false);
  });

  test('DeleteProduct removes row', () async {
    final product = await CreateProduct(repository).call(
      name: 'Teh',
      price: 12000,
      categoryId: 'cat-1',
      isActive: true,
      id: 'prod-2',
    );
    await DeleteProduct(repository).call(product.id);
    expect(await repository.getProductById(product.id), null);
  });
}
