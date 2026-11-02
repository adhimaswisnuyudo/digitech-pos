import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart/cart_notifier.dart';
import 'cashier_cart_panel.dart';

class CashierCartSheet extends ConsumerWidget {
  const CashierCartSheet({super.key, this.showPayHint = false});

  final bool showPayHint;

  static Future<void> show(
    BuildContext context, {
    bool showPayHint = false,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        final maxHeight = MediaQuery.sizeOf(context).height * 0.75;
        return SizedBox(
          height: maxHeight,
          child: CashierCartSheet(showPayHint: showPayHint),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = ref.watch(cartProvider);
    if (lines.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Keranjang kosong'),
      );
    }

    return CashierCartPanel(
      showPayHint: showPayHint,
      onDismiss: () => Navigator.of(context).pop(),
    );
  }
}
