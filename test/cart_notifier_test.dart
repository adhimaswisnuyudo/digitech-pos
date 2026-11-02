import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/domain/entities/cart_line.dart';
import 'package:cashier_point_of_sales/domain/entities/product.dart';
import 'package:cashier_point_of_sales/presentation/features/cashier/cart/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  test('CartNotifier adds and merges qty', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(cartProvider.notifier);
    const product = Product(
      id: 'p1',
      categoryId: 'c1',
      name: 'Kopi',
      price: 18000,
      isActive: true,
      isDemo: false,
    );

    notifier.addProduct(product);
    notifier.addProduct(product);

    final lines = container.read(cartProvider);
    expect(lines.length, 1);
    expect(lines.first.qty, 2);
    expect(cartSubtotal(lines), 36000);
  });

  test('CartNotifier decrement removes at qty 1', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(cartProvider.notifier);
    notifier.state = [
      const CartLine(
        productId: 'p1',
        productName: 'Teh',
        unitPrice: 12000,
        qty: 1,
      ),
    ];

    notifier.decrementLine('p1');
    expect(container.read(cartProvider), isEmpty);
  });
}
