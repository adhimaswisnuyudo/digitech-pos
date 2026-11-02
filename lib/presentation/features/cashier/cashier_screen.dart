import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/product.dart';
import '../../shared/empty_state.dart';
import '../../shared/money_text.dart';
import '../settings/settings_providers.dart';
import 'cart/cart_notifier.dart';
import 'cashier_cart_panel.dart';
import 'cashier_cart_sheet.dart';
import 'cashier_colors.dart';
import 'cashier_layout.dart';
import 'cashier_providers.dart';
import 'widgets/cashier_category_chips.dart';
import 'widgets/cashier_product_list_tile.dart';

class CashierScreen extends ConsumerStatefulWidget {
  const CashierScreen({super.key});

  @override
  ConsumerState<CashierScreen> createState() => _CashierScreenState();
}

class _CashierScreenState extends ConsumerState<CashierScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addProduct(Product product) {
    ref.read(cartProvider.notifier).addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    final splitLayout = cashierUseSplitLayout(context);
    final cartCount = ref.watch(cartItemCountProvider);
    final settingsAsync = ref.watch(appSettingsProvider);

    final outletName = settingsAsync.maybeWhen(
      data: (s) => s.outletName,
      orElse: () => 'Outlet Saya',
    );

    return Theme(
      data: cashierLocalTheme(context),
      child: Scaffold(
        backgroundColor: CashierColors.cream,
        body: splitLayout
            ? SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _CashierTopBar(
                            outletName: outletName,
                            cartCount: cartCount,
                            showCartAction: false,
                            onCartTap: () => CashierCartSheet.show(context),
                          ),
                          Expanded(
                            child: _CashierMenuBody(
                              searchController: _searchController,
                              onAdd: _addProduct,
                              compactHeader: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      flex: 2,
                      child: CashierCartPanel(
                        embedded: true,
                        showPayHint: true,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CashierTopBar(
                    outletName: outletName,
                    cartCount: cartCount,
                    showCartAction: true,
                    onCartTap: () {
                      if (cartCount > 0) {
                        CashierCartSheet.show(context);
                      }
                    },
                  ),
                  Expanded(
                    child: _CashierMenuBody(
                      searchController: _searchController,
                      onAdd: _addProduct,
                    ),
                  ),
                  _CashierOrderSummaryBar(
                    onOpenCart: () => CashierCartSheet.show(context),
                    onPay: () => CashierCartSheet.show(
                      context,
                      showPayHint: true,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CashierTopBar extends StatelessWidget {
  const _CashierTopBar({
    required this.outletName,
    required this.cartCount,
    required this.showCartAction,
    required this.onCartTap,
  });

  final String outletName;
  final int cartCount;
  final bool showCartAction;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: CashierColors.chocolate,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    outletName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                if (showCartAction)
                  IconButton(
                    onPressed: cartCount == 0 ? null : onCartTap,
                    icon: Badge(
                      isLabelVisible: cartCount > 0,
                      backgroundColor: Colors.red.shade700,
                      label: Text('$cartCount'),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 48),
              ],
            ),
          ),
        ),
        Container(
          color: CashierColors.cream,
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kasir',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: CashierColors.chocolateDark,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pilih menu untuk ditambahkan ke pesanan',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade700,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CashierMenuBody extends ConsumerWidget {
  const _CashierMenuBody({
    required this.searchController,
    required this.onAdd,
    this.compactHeader = false,
  });

  final TextEditingController searchController;
  final void Function(Product product) onAdd;
  final bool compactHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(activeCashierListItemsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!compactHeader) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: searchController,
              onChanged: (value) =>
                  ref.read(cashierSearchQueryProvider.notifier).setQuery(value),
              decoration: InputDecoration(
                hintText: 'Cari menu...',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                ),
                suffixIcon: Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ] else
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: searchController,
              onChanged: (value) =>
                  ref.read(cashierSearchQueryProvider.notifier).setQuery(value),
              decoration: const InputDecoration(
                hintText: 'Cari menu...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        const CashierCategoryChips(),
        const SizedBox(height: 12),
        Expanded(
          child: itemsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Gagal memuat: $error')),
            data: (items) {
              if (items.isEmpty) {
                return EmptyState(
                  message: 'Menu tidak ditemukan.\nCoba kata kunci atau filter lain.',
                  icon: Icons.search_off_outlined,
                  action: FilledButton(
                    onPressed: () => context.go('/menu'),
                    child: const Text('Ke Menu'),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CashierProductListTile(
                    product: item.product,
                    categoryName: item.categoryName,
                    onAdd: () => onAdd(item.product),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CashierOrderSummaryBar extends ConsumerWidget {
  const _CashierOrderSummaryBar({
    required this.onOpenCart,
    required this.onPay,
  });

  final VoidCallback onOpenCart;
  final VoidCallback onPay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartItemCountProvider);
    final subtotal = ref.watch(cartSubtotalProvider);
    final hasItems = cartCount > 0;

    return Material(
      color: Colors.white,
      elevation: 12,
      shadowColor: Colors.black26,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: hasItems ? onOpenCart : null,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                hasItems ? '$cartCount Item' : '0 Item',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                              ),
                              MoneyText(
                                subtotal,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: CashierColors.chocolateDark,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (hasItems)
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.grey.shade600,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: hasItems ? onPay : null,
                style: FilledButton.styleFrom(
                  backgroundColor: CashierColors.chocolate,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.account_balance_wallet_outlined, size: 20),
                label: const Text('Lanjut Bayar'),
                iconAlignment: IconAlignment.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
