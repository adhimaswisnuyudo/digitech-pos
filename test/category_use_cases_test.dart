import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/application/use_cases/create_category.dart';
import 'package:cashier_point_of_sales/application/use_cases/delete_category.dart';
import 'package:cashier_point_of_sales/application/use_cases/update_category.dart';
import 'package:cashier_point_of_sales/data/local/database/app_database.dart';
import 'package:cashier_point_of_sales/data/local/database/daos/catalog_dao.dart';
import 'package:cashier_point_of_sales/data/repositories/category_repository_impl.dart';
import 'package:cashier_point_of_sales/domain/errors/category_has_products_exception.dart';

void main() {
  late AppDatabase database;
  late CatalogDao catalogDao;
  late CategoryRepositoryImpl repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    catalogDao = CatalogDao(database);
    repository = CategoryRepositoryImpl(catalogDao);
  });

  tearDown(() async {
    await database.close();
  });

  test('CreateCategory adds category with sort order', () async {
    final create = CreateCategory(repository);
    final first = await create.call('Minuman');
    final second = await create.call('Makanan');

    expect(first.sortOrder, 0);
    expect(second.sortOrder, 1);
    expect(await repository.countCategories(), 2);
  });

  test('UpdateCategory changes name', () async {
    final category =
        await CreateCategory(repository).call('Snack');
    await UpdateCategory(repository).call(
      id: category.id,
      name: 'Camilan',
    );

    final list = await repository.getAllCategories();
    expect(list.single.name, 'Camilan');
  });

  test('DeleteCategory blocked when category has products', () async {
    final now = DateTime.now().toUtc();
    final category =
        await CreateCategory(repository).call('Minuman');
    await catalogDao.insertProduct(
      ProductsCompanion.insert(
        id: 'prod-1',
        categoryId: category.id,
        name: 'Kopi',
        price: 10000,
        createdAt: now,
        updatedAt: now,
      ),
    );

    expect(
      () => DeleteCategory(repository).call(category.id),
      throwsA(isA<CategoryHasProductsException>()),
    );
  });

  test('DeleteCategory succeeds when empty', () async {
    final category =
        await CreateCategory(repository).call('Kosong');
    await DeleteCategory(repository).call(category.id);
    expect(await repository.countCategories(), 0);
  });
}
