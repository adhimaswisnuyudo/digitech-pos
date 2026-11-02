import '../../domain/repositories/category_repository.dart';

class UpdateCategory {
  UpdateCategory(this._repository);

  final CategoryRepository _repository;

  Future<void> call({required String id, required String name}) {
    return _repository.updateCategory(id: id, name: name);
  }
}
