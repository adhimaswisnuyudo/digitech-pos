import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/use_cases/create_product.dart';
import '../../../../application/use_cases/delete_product.dart';
import '../../../../application/use_cases/set_product_active.dart';
import '../../../../application/use_cases/update_product.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../data/local/storage/product_image_storage.dart';
import '../../../../domain/entities/product.dart';

final productImageStorageProvider = Provider<ProductImageStorage>((ref) {
  return ProductImageStorage();
});

final productListItemsProvider = StreamProvider<List<ProductListItem>>((ref) async* {
  await ref.watch(initializeAppProvider.future);
  yield* ref.watch(productRepositoryProvider).watchProductListItems();
});

final productByIdProvider =
    FutureProvider.family<Product?, String>((ref, id) async {
  await ref.watch(initializeAppProvider.future);
  return ref.watch(productRepositoryProvider).getProductById(id);
});

final createProductUseCaseProvider = Provider<CreateProduct>((ref) {
  return CreateProduct(ref.watch(productRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProduct>((ref) {
  return UpdateProduct(ref.watch(productRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider<DeleteProduct>((ref) {
  return DeleteProduct(ref.watch(productRepositoryProvider));
});

final setProductActiveUseCaseProvider = Provider<SetProductActive>((ref) {
  return SetProductActive(ref.watch(productRepositoryProvider));
});
