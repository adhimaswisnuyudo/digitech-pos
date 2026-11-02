import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class CreateCategory {
  CreateCategory(this._repository);

  final CategoryRepository _repository;

  Future<Category> call(String name) => _repository.createCategory(name);
}
