import '../entities/product.dart';

abstract class ProductRepository {
  Future<int> countProducts();

  Stream<List<Product>> watchAllProducts();

  Stream<List<Product>> watchActiveProducts({String? categoryId});

  Stream<List<ProductListItem>> watchProductListItems();

  Future<Product?> getProductById(String id);

  Future<Product> createProduct({
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    String? id,
  });

  Future<void> updateProduct({
    required String id,
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    bool clearImage = false,
  });

  Future<void> deleteProduct(String id);

  Future<void> setProductActive(String id, bool isActive);

  Future<int> deleteDemoProducts();
}
