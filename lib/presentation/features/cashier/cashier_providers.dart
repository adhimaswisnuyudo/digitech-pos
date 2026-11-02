import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../domain/entities/product.dart';

class CashierCategoryFilter extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? categoryId) {
    state = categoryId;
  }
}

final cashierCategoryFilterProvider =
    NotifierProvider<CashierCategoryFilter, String?>(CashierCategoryFilter.new);

class CashierSearchQuery extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) {
    state = value.trim();
  }
}

final cashierSearchQueryProvider =
    NotifierProvider<CashierSearchQuery, String>(CashierSearchQuery.new);

final activeCashierProductsProvider = StreamProvider<List<Product>>((ref) async* {
  await ref.watch(initializeAppProvider.future);
  final categoryId = ref.watch(cashierCategoryFilterProvider);
  yield* ref
      .watch(productRepositoryProvider)
      .watchActiveProducts(categoryId: categoryId);
});

final activeCashierListItemsProvider =
    StreamProvider<List<ProductListItem>>((ref) async* {
  await ref.watch(initializeAppProvider.future);
  final categoryId = ref.watch(cashierCategoryFilterProvider);
  final query = ref.watch(cashierSearchQueryProvider).toLowerCase();

  yield* ref.watch(productRepositoryProvider).watchProductListItems().map(
        (items) {
          return items.where((item) {
            if (!item.product.isActive) return false;
            if (categoryId != null && item.product.categoryId != categoryId) {
              return false;
            }
            if (query.isNotEmpty &&
                !item.product.name.toLowerCase().contains(query)) {
              return false;
            }
            return true;
          }).toList();
        },
      );
});
