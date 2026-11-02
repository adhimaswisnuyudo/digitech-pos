import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/category.dart' as domain;
import '../../domain/errors/category_has_products_exception.dart';
import '../../domain/repositories/category_repository.dart';
import '../local/database/daos/catalog_dao.dart';
import '../local/database/app_database.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this._catalogDao, {Uuid? uuid})
      : _uuid = uuid ?? const Uuid();

  final CatalogDao _catalogDao;
  final Uuid _uuid;

  domain.Category _mapRow(CategoryRow row) {
    return domain.Category(
      id: row.id,
      name: row.name,
      sortOrder: row.sortOrder,
    );
  }

  @override
  Future<int> countCategories() => _catalogDao.countCategories();

  @override
  Future<List<domain.Category>> getAllCategories() async {
    final rows = await _catalogDao.getAllCategories();
    return rows.map(_mapRow).toList();
  }

  @override
  Stream<List<domain.Category>> watchAllCategories() {
    return _catalogDao.watchAllCategories().map(
          (rows) => rows.map(_mapRow).toList(),
        );
  }

  @override
  Future<domain.Category> createCategory(String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Nama kategori wajib diisi');
    }
    final now = DateTime.now().toUtc();
    final sortOrder = await _catalogDao.countCategories();
    final id = _uuid.v4();
    await _catalogDao.insertCategory(
      CategoriesCompanion.insert(
        id: id,
        name: trimmed,
        sortOrder: Value(sortOrder),
        createdAt: now,
        updatedAt: now,
      ),
    );
    return domain.Category(id: id, name: trimmed, sortOrder: sortOrder);
  }

  @override
  Future<void> updateCategory({
    required String id,
    required String name,
  }) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Nama kategori wajib diisi');
    }
    await _catalogDao.updateCategoryName(
      id: id,
      name: trimmed,
      updatedAt: DateTime.now().toUtc(),
    );
  }

  @override
  Future<void> deleteCategory(String id) async {
    final productCount = await _catalogDao.countProductsInCategory(id);
    if (productCount > 0) {
      throw CategoryHasProductsException();
    }
    await _catalogDao.deleteCategoryById(id);
  }

  @override
  Future<int> countProductsInCategory(String categoryId) {
    return _catalogDao.countProductsInCategory(categoryId);
  }
}
