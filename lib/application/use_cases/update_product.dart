import '../../domain/repositories/product_repository.dart';

class UpdateProduct {
  UpdateProduct(this._repository);

  final ProductRepository _repository;

  Future<void> call({
    required String id,
    required String name,
    required int price,
    required String categoryId,
    required bool isActive,
    String? imagePath,
    bool clearImage = false,
  }) {
    return _repository.updateProduct(
      id: id,
      name: name,
      price: price,
      categoryId: categoryId,
      isActive: isActive,
      imagePath: imagePath,
      clearImage: clearImage,
    );
  }
}
