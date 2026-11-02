import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class CreateProduct {
  CreateProduct(this._repository);

  final ProductRepository _repository;

  Future<Product> call({
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    String? id,
  }) {
    return _repository.createProduct(
      name: name,
      price: price,
      categoryId: categoryId,
      isActive: isActive,
      imagePath: imagePath,
      id: id,
    );
  }
}
