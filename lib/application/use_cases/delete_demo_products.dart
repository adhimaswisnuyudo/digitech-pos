import '../../domain/repositories/product_repository.dart';

class DeleteDemoProducts {
  DeleteDemoProducts(this._productRepository);

  final ProductRepository _productRepository;

  Future<int> call() => _productRepository.deleteDemoProducts();
}
