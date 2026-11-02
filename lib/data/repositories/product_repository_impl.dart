import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/product.dart' as domain;
import '../../domain/repositories/product_repository.dart';
import '../local/database/app_database.dart';
import '../local/database/daos/catalog_dao.dart';
import '../local/storage/product_image_storage.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
    this._catalogDao, {
    ProductImageStorage? imageStorage,
    Uuid? uuid,
  })  : _imageStorage = imageStorage ?? ProductImageStorage(),
        _uuid = uuid ?? const Uuid();

  final CatalogDao _catalogDao;
  final ProductImageStorage _imageStorage;
  final Uuid _uuid;

  domain.Product _mapRow(ProductRow row) {
    return domain.Product(
      id: row.id,
      categoryId: row.categoryId,
      name: row.name,
      price: row.price,
      isActive: row.isActive,
      isDemo: row.isDemo,
      imagePath: row.imagePath,
    );
  }

  @override
  Future<int> countProducts() => _catalogDao.countProducts();

  @override
  Stream<List<domain.Product>> watchAllProducts() {
    return _catalogDao.watchAllProducts().map(
          (rows) => rows.map(_mapRow).toList(),
        );
  }

  @override
  Stream<List<domain.Product>> watchActiveProducts({String? categoryId}) {
    return _catalogDao.watchActiveProducts(categoryId: categoryId).map(
          (rows) => rows.map(_mapRow).toList(),
        );
  }

  @override
  Stream<List<domain.ProductListItem>> watchProductListItems() async* {
    await for (final rows in _catalogDao.watchAllProducts()) {
      final nameMap = await _catalogDao.getCategoryNameMap();
      yield rows
          .map(
            (row) => domain.ProductListItem(
              product: _mapRow(row),
              categoryName: nameMap[row.categoryId] ?? '-',
            ),
          )
          .toList();
    }
  }

  @override
  Future<domain.Product?> getProductById(String id) async {
    final row = await _catalogDao.getProductById(id);
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<domain.Product> createProduct({
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    String? id,
  }) async {
    _validateProduct(name: name, price: price, categoryId: categoryId);
    final now = DateTime.now().toUtc();
    final productId = id ?? _uuid.v4();
    await _catalogDao.insertProduct(
      ProductsCompanion.insert(
        id: productId,
        categoryId: categoryId,
        name: name.trim(),
        price: price,
        isActive: Value(isActive),
        isDemo: const Value(false),
        imagePath: imagePath == null ? const Value.absent() : Value(imagePath),
        createdAt: now,
        updatedAt: now,
      ),
    );
    return domain.Product(
      id: productId,
      categoryId: categoryId,
      name: name.trim(),
      price: price,
      isActive: isActive,
      isDemo: false,
      imagePath: imagePath,
    );
  }

  @override
  Future<void> updateProduct({
    required String id,
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    bool clearImage = false,
  }) async {
    _validateProduct(name: name, price: price, categoryId: categoryId);
    final existing = await _catalogDao.getProductById(id);
    if (existing == null) {
      throw ArgumentError('Produk tidak ditemukan');
    }

    if (clearImage && existing.imagePath != null) {
      await _imageStorage.deleteIfExists(existing.imagePath);
    }

    await _catalogDao.updateProductRow(
      id,
      ProductsCompanion(
        name: Value(name.trim()),
        price: Value(price),
        categoryId: Value(categoryId),
        isActive: Value(isActive),
        imagePath: clearImage
            ? const Value(null)
            : imagePath == null
                ? const Value.absent()
                : Value(imagePath),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  @override
  Future<void> deleteProduct(String id) async {
    final existing = await _catalogDao.getProductById(id);
    if (existing == null) {
      return;
    }
    await _imageStorage.deleteIfExists(existing.imagePath);
    await _catalogDao.deleteProductById(id);
  }

  @override
  Future<int> deleteDemoProducts() => _catalogDao.deleteDemoProducts();

  @override
  Future<void> setProductActive(String id, bool isActive) async {
    final existing = await _catalogDao.getProductById(id);
    if (existing == null) {
      throw ArgumentError('Produk tidak ditemukan');
    }
    await _catalogDao.setProductActive(id, isActive);
  }

  void _validateProduct({
    required String name,
    required int price,
    required String categoryId,
  }) {
    if (name.trim().isEmpty) {
      throw ArgumentError('Nama menu wajib diisi');
    }
    if (price <= 0) {
      throw ArgumentError('Harga harus lebih dari 0');
    }
    if (categoryId.isEmpty) {
      throw ArgumentError('Kategori wajib dipilih');
    }
  }
}
