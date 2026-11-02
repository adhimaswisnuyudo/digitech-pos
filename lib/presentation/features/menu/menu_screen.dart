import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'products/menu_product_list_tile.dart';
import 'products/menu_products_providers.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(productListItemsProvider);
    final imageStorage = ref.watch(productImageStorageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.category_outlined),
            tooltip: 'Kategori',
            onPressed: () => context.push('/menu/categories'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/menu/product/new'),
        child: const Icon(Icons.add),
      ),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Gagal memuat: $error')),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum ada menu.'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => context.push('/menu/product/new'),
                    child: const Text('Tambah menu'),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 88),
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return MenuProductListTile(
                item: items[index],
                imageStorage: imageStorage,
              );
            },
          );
        },
      ),
    );
  }
}
