import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/category.dart';
import '../../../../domain/errors/category_has_products_exception.dart';
import '../../../shared/confirm_dialog.dart';
import '../../../shared/empty_state.dart';
import 'categories_providers.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  final _nameController = TextEditingController();
  bool _isAdding = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _addCategory() async {
    final name = _nameController.text;
    if (name.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama kategori wajib diisi')),
      );
      return;
    }

    setState(() => _isAdding = true);
    try {
      await ref.read(createCategoryUseCaseProvider).call(name);
      _nameController.clear();
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kategori ditambahkan')),
      );
    } on ArgumentError catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Nama tidak valid')),
      );
    } finally {
      if (mounted) {
        setState(() => _isAdding = false);
      }
    }
  }

  Future<void> _editCategory(Category category) async {
    final controller = TextEditingController(text: category.name);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah kategori'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Nama kategori'),
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
    controller.dispose();

    if (newName == null || !mounted) {
      return;
    }

    try {
      await ref.read(updateCategoryUseCaseProvider).call(
            id: category.id,
            name: newName,
          );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kategori diperbarui')),
      );
    } on ArgumentError catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Nama tidak valid')),
      );
    }
  }

  Future<void> _deleteCategory(Category category) async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Hapus kategori?',
      message: 'Kategori "${category.name}" akan dihapus.',
      confirmLabel: 'Hapus',
      isDestructive: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }

    try {
      await ref.read(deleteCategoryUseCaseProvider).call(category.id);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kategori dihapus')),
      );
    } on CategoryHasProductsException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola kategori'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama kategori baru',
                    ),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _addCategory(),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _isAdding ? null : _addCategory,
                  child: _isAdding
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Tambah'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: categoriesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Gagal memuat: $error')),
              data: (categories) {
                if (categories.isEmpty) {
                  return const EmptyState(
                    message: 'Belum ada kategori.\nTambahkan kategori pertama.',
                    icon: Icons.category_outlined,
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: categories.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      title: Text(category.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            tooltip: 'Ubah',
                            onPressed: () => _editCategory(category),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            tooltip: 'Hapus',
                            onPressed: () => _deleteCategory(category),
                          ),
                        ],
                      ),
                      onTap: () => _editCategory(category),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
