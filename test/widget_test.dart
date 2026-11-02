import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cashier_point_of_sales/app.dart';

void main() {
  testWidgets('App shows loading then shell', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: CashierApp()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
