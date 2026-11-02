import '../entities/category.dart';

abstract class CategoryRepository {
  Future<int> countCategories();

  Future<List<Category>> getAllCategories();

  Stream<List<Category>> watchAllCategories();

  Future<Category> createCategory(String name);

  Future<void> updateCategory({required String id, required String name});

  Future<void> deleteCategory(String id);

  Future<int> countProductsInCategory(String categoryId);
}
