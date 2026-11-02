import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/product.dart';
import '../../../shared/money_text.dart';
import '../../menu/products/menu_products_providers.dart';
import '../cashier_colors.dart';
import 'product_square_image.dart';

class CashierProductListTile extends ConsumerWidget {
  const CashierProductListTile({
    super.key,
    required this.product,
    required this.categoryName,
    required this.onAdd,
  });

  final Product product;
  final String categoryName;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageStorage = ref.watch(productImageStorageProvider);
    final theme = Theme.of(context);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ProductSquareImage(
                  imagePath: product.imagePath,
                  imageStorage: imageStorage,
                  borderRadius: 12,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: CashierColors.categoryPill,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        categoryName,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: CashierColors.categoryPillText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MoneyText(
                      product.price,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Material(
                color: CashierColors.chocolate,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(12),
                  child: const SizedBox(
                    width: 44,
                    height: 44,
                    child: Icon(Icons.add, color: Colors.white, size: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
