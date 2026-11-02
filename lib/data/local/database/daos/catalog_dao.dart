import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/categories.dart';
import '../tables/products.dart';

part 'catalog_dao.g.dart';

@DriftAccessor(tables: [Categories, Products])
class CatalogDao extends DatabaseAccessor<AppDatabase> with _$CatalogDaoMixin {
  CatalogDao(super.db);

  Future<int> countCategories() async {
    final countExp = db.categories.id.count();
    final query = db.selectOnly(db.categories)..addColumns([countExp]);
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }

  Future<List<CategoryRow>> getAllCategories() {
    return (db.select(db.categories)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
  }

  Stream<List<CategoryRow>> watchAllCategories() {
    return (db.select(db.categories)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .watch();
  }

  Future<int> countProductsInCategory(String categoryId) async {
    final countExp = db.products.id.count();
    final query = db.selectOnly(db.products)
      ..addColumns([countExp])
      ..where(db.products.categoryId.equals(categoryId));
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }

  Future<void> updateCategoryName({
    required String id,
    required String name,
    required DateTime updatedAt,
  }) {
    return (db.update(db.categories)..where((t) => t.id.equals(id))).write(
      CategoriesCompanion(
        name: Value(name),
        updatedAt: Value(updatedAt),
      ),
    );
  }

  Future<int> deleteCategoryById(String id) {
    return (db.delete(db.categories)..where((t) => t.id.equals(id))).go();
  }

  Future<int> countProducts() async {
    final countExp = db.products.id.count();
    final query = db.selectOnly(db.products)..addColumns([countExp]);
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }

  Stream<List<ProductRow>> watchAllProducts() {
    return (db.select(db.products)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  Stream<List<ProductRow>> watchActiveProducts({String? categoryId}) {
    return (db.select(db.products)
          ..where((t) {
            var condition = t.isActive.equals(true);
            if (categoryId != null) {
              condition = condition & t.categoryId.equals(categoryId);
            }
            return condition;
          })
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  Future<void> insertCategory(CategoriesCompanion row) {
    return db.into(db.categories).insert(row);
  }

  Future<void> insertProduct(ProductsCompanion row) {
    return db.into(db.products).insert(row);
  }

  Future<int> deleteDemoProducts() {
    return (db.delete(db.products)..where((t) => t.isDemo.equals(true))).go();
  }

  Future<int> countDemoProducts() async {
    final countExp = db.products.id.count();
    final query = db.selectOnly(db.products)
      ..addColumns([countExp])
      ..where(db.products.isDemo.equals(true));
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }

  Future<ProductRow?> getProductById(String id) {
    return (db.select(db.products)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> updateProductRow(String id, ProductsCompanion companion) {
    return (db.update(db.products)..where((t) => t.id.equals(id)))
        .write(companion);
  }

  Future<int> deleteProductById(String id) {
    return (db.delete(db.products)..where((t) => t.id.equals(id))).go();
  }

  Future<void> setProductActive(String id, bool isActive) {
    return (db.update(db.products)..where((t) => t.id.equals(id))).write(
      ProductsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<Map<String, String>> getCategoryNameMap() async {
    final categories = await getAllCategories();
    return {for (final c in categories) c.id: c.name};
  }
}
