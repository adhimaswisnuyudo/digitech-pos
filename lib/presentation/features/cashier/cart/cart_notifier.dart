import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/cart_line.dart';
import '../../../../domain/entities/product.dart';

class CartNotifier extends Notifier<List<CartLine>> {
  @override
  List<CartLine> build() => [];

  void addProduct(Product product) {
    final index = state.indexWhere((line) => line.productId == product.id);
    if (index >= 0) {
      final updated = [...state];
      updated[index] = updated[index].copyWith(qty: updated[index].qty + 1);
      state = updated;
      return;
    }
    state = [...state, CartLine.fromProduct(product)];
  }

  void incrementLine(String productId) {
    final index = state.indexWhere((line) => line.productId == productId);
    if (index < 0) {
      return;
    }
    final updated = [...state];
    updated[index] = updated[index].copyWith(qty: updated[index].qty + 1);
    state = updated;
  }

  void decrementLine(String productId) {
    final index = state.indexWhere((line) => line.productId == productId);
    if (index < 0) {
      return;
    }
    final line = state[index];
    if (line.qty <= 1) {
      removeLine(productId);
      return;
    }
    final updated = [...state];
    updated[index] = line.copyWith(qty: line.qty - 1);
    state = updated;
  }

  void removeLine(String productId) {
    state = state.where((line) => line.productId != productId).toList();
  }

  void clear() {
    state = [];
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<CartLine>>(
  CartNotifier.new,
);

final cartSubtotalProvider = Provider<int>((ref) {
  return cartSubtotal(ref.watch(cartProvider));
});

final cartItemCountProvider = Provider<int>((ref) {
  return cartItemCount(ref.watch(cartProvider));
});
