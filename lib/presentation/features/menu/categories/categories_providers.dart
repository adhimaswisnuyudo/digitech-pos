import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/use_cases/create_category.dart';
import '../../../../application/use_cases/delete_category.dart';
import '../../../../application/use_cases/update_category.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../domain/entities/category.dart';

final categoriesStreamProvider = StreamProvider<List<Category>>((ref) async* {
  await ref.watch(initializeAppProvider.future);
  yield* ref.watch(categoryRepositoryProvider).watchAllCategories();
});

final createCategoryUseCaseProvider = Provider<CreateCategory>((ref) {
  return CreateCategory(ref.watch(categoryRepositoryProvider));
});

final updateCategoryUseCaseProvider = Provider<UpdateCategory>((ref) {
  return UpdateCategory(ref.watch(categoryRepositoryProvider));
});

final deleteCategoryUseCaseProvider = Provider<DeleteCategory>((ref) {
  return DeleteCategory(ref.watch(categoryRepositoryProvider));
});
