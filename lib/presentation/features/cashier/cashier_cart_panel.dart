import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/cart_line.dart';
import '../../shared/money_text.dart';
import '../../shared/primary_button.dart';
import 'cart/cart_notifier.dart';

class CashierCartPanel extends ConsumerWidget {
  const CashierCartPanel({
    super.key,
    this.showPayHint = false,
    this.embedded = false,
    this.onDismiss,
  });

  final bool showPayHint;
  final bool embedded;
  final VoidCallback? onDismiss;

  void _onPay(BuildContext context) {
    onDismiss?.call();
    if (showPayHint) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Checkout — Fase 6')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = ref.watch(cartProvider);
    final subtotal = ref.watch(cartSubtotalProvider);
    final theme = Theme.of(context);

    return Material(
      color: embedded ? theme.colorScheme.surface : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
            child: Row(
              children: [
                Text('Keranjang', style: theme.textTheme.titleLarge),
                const Spacer(),
                if (lines.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).clear();
                    },
                    child: const Text('Kosongkan'),
                  ),
              ],
            ),
          ),
          Expanded(
            child: lines.isEmpty
                ? Center(
                    child: Text(
                      'Belum ada item',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: lines.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return _CartLineRow(line: lines[index]);
                    },
                  ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: theme.textTheme.titleMedium),
                    MoneyText(subtotal, style: theme.textTheme.titleMedium),
                  ],
                ),
                if (showPayHint) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Pembayaran tunai — lanjut Fase 6.',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
                const SizedBox(height: 12),
                PrimaryButton(
                  label: embedded ? 'Bayar' : (showPayHint ? 'Lanjut bayar' : 'Tutup'),
                  onPressed: lines.isEmpty
                      ? null
                      : () {
                          if (embedded || showPayHint) {
                            _onPay(context);
                          } else {
                            onDismiss?.call();
                          }
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartLineRow extends ConsumerWidget {
  const _CartLineRow({required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(line.productName),
      subtitle: MoneyText(line.unitPrice),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () =>
                ref.read(cartProvider.notifier).decrementLine(line.productId),
          ),
          Text('${line.qty}'),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () =>
                ref.read(cartProvider.notifier).incrementLine(line.productId),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            onPressed: () =>
                ref.read(cartProvider.notifier).removeLine(line.productId),
          ),
        ],
      ),
    );
  }
}
