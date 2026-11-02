import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/local/storage/product_image_storage.dart';
import '../../../../domain/entities/product.dart';
import '../../../shared/money_text.dart';
import 'menu_products_providers.dart';
import 'product_thumbnail.dart';

class MenuProductListTile extends ConsumerWidget {
  const MenuProductListTile({
    super.key,
    required this.item,
    required this.imageStorage,
  });

  final ProductListItem item;
  final ProductImageStorage imageStorage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = item.product;
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.horizontal,
      background: _SwipeActionBackground(
        alignment: Alignment.centerLeft,
        color: colorScheme.primaryContainer,
        icon: Icons.check_circle_outline,
        label: 'Aktifkan',
      ),
      secondaryBackground: _SwipeActionBackground(
        alignment: Alignment.centerRight,
        color: colorScheme.errorContainer,
        icon: Icons.visibility_off_outlined,
        label: 'Nonaktifkan',
      ),
      confirmDismiss: (direction) async {
        final activate = direction == DismissDirection.startToEnd;
        if (product.isActive == activate) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  activate ? 'Menu sudah aktif' : 'Menu sudah nonaktif',
                ),
              ),
            );
          }
          return false;
        }

        await ref.read(setProductActiveUseCaseProvider).call(
              id: product.id,
              isActive: activate,
            );
        HapticFeedback.lightImpact();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                activate ? '${product.name} diaktifkan' : '${product.name} dinonaktifkan',
              ),
            ),
          );
        }
        return false;
      },
      child: ListTile(
        leading: ProductThumbnail(
          product: product,
          imageStorage: imageStorage,
        ),
        title: Text(product.name),
        subtitle: Text(item.categoryName),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MoneyText(
              product.price,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 4,
              children: [
                if (product.isDemo)
                  _Badge(
                    label: 'Demo',
                    color: colorScheme.tertiaryContainer,
                  ),
                _Badge(
                  label: product.isActive ? 'Aktif' : 'Nonaktif',
                  color: product.isActive
                      ? colorScheme.secondaryContainer
                      : colorScheme.surfaceContainerHighest,
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () => context.push('/menu/product/${product.id}'),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}

class _SwipeActionBackground extends StatelessWidget {
  const _SwipeActionBackground({
    required this.alignment,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Alignment alignment;
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignment == Alignment.centerRight) ...[
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 8),
          ],
          Icon(icon),
          if (alignment == Alignment.centerLeft) ...[
            const SizedBox(width: 8),
            Text(label, style: Theme.of(context).textTheme.labelLarge),
          ],
        ],
      ),
    );
  }
}