import '../../domain/repositories/product_repository.dart';

class SetProductActive {
  SetProductActive(this._repository);

  final ProductRepository _repository;

  Future<void> call({required String id, required bool isActive}) {
    return _repository.setProductActive(id, isActive);
  }
}
