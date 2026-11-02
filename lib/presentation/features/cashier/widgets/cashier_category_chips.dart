import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cashier_colors.dart';
import '../cashier_providers.dart';
import '../../menu/categories/categories_providers.dart';

class CashierCategoryChips extends ConsumerWidget {
  const CashierCategoryChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final selectedCategory = ref.watch(cashierCategoryFilterProvider);

    return categoriesAsync.when(
      loading: () => const SizedBox(height: 48),
      error: (_, _) => const SizedBox.shrink(),
      data: (categories) => SizedBox(
        height: 44,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            _Chip(
              label: 'Semua',
              icon: cashierCategoryIcon('Semua'),
              selected: selectedCategory == null,
              onTap: () => ref
                  .read(cashierCategoryFilterProvider.notifier)
                  .select(null),
            ),
            for (final category in categories) ...[
              const SizedBox(width: 8),
              _Chip(
                label: category.name,
                icon: cashierCategoryIcon(category.name),
                selected: selectedCategory == category.id,
                onTap: () => ref
                    .read(cashierCategoryFilterProvider.notifier)
                    .select(category.id),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? CashierColors.chocolate : CashierColors.chipInactive;
    final fg = selected ? Colors.white : CashierColors.chocolateDark;
    final borderColor =
        selected ? CashierColors.chocolate : Colors.grey.shade300;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: fg),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: fg,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
