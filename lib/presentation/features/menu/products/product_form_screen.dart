import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/currency_format.dart';
import '../../../shared/confirm_dialog.dart';
import '../categories/categories_providers.dart';
import 'menu_products_providers.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  const ProductFormScreen({super.key, this.productId});

  final String? productId;

  bool get isEditing => productId != null;

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String? _categoryId;
  bool _isActive = true;
  bool _formInitialized = false;
  bool _isSaving = false;

  XFile? _pendingImage;
  File? _existingImageFile;
  String? _existingImagePath;
  bool _clearImage = false;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadExisting());
    } else {
      _formInitialized = true;
    }
  }

  Future<void> _loadExisting() async {
    if (_formInitialized) {
      return;
    }
    final product = await ref.read(productByIdProvider(widget.productId!).future);
    if (product == null || !mounted) {
      return;
    }
    _nameController.text = product.name;
    _priceController.text = product.price.toString();
    _categoryId = product.categoryId;
    _isActive = product.isActive;
    _existingImagePath = product.imagePath;
    if (product.imagePath != null) {
      _existingImageFile =
          await ref.read(productImageStorageProvider).resolveFile(product.imagePath);
    }
    setState(() => _formInitialized = true);
  }

  int? _parsePrice() {
    final digits = _priceController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      return null;
    }
    return int.tryParse(digits);
  }

  Future<void> _pickImage(ImageSource source) async {
    final storage = ref.read(productImageStorageProvider);
    final file = source == ImageSource.camera
        ? await storage.captureFromCamera()
        : await storage.pickFromGallery();
    if (file == null || !mounted) {
      return;
    }
    setState(() {
      _pendingImage = file;
      _clearImage = false;
      _existingImageFile = File(file.path);
    });
  }

  Future<void> _removeImage() async {
    setState(() {
      _pendingImage = null;
      _existingImageFile = null;
      _clearImage = true;
    });
  }

  Future<void> _save() async {
    final price = _parsePrice();
    if (_categoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih kategori')),
      );
      return;
    }
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harga tidak valid')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final storage = ref.read(productImageStorageProvider);
      final productId = widget.productId ?? const Uuid().v4();
      String? imagePath = _clearImage ? null : _existingImagePath;

      if (_pendingImage != null) {
        if (widget.isEditing && _existingImagePath != null) {
          await storage.deleteIfExists(_existingImagePath);
        }
        imagePath = await storage.saveFromXFile(_pendingImage!, productId);
      }

      if (widget.isEditing) {
        await ref.read(updateProductUseCaseProvider).call(
              id: widget.productId!,
              name: _nameController.text,
              price: price,
              categoryId: _categoryId!,
              isActive: _isActive,
              imagePath: imagePath,
              clearImage: _clearImage && _pendingImage == null,
            );
      } else {
        await ref.read(createProductUseCaseProvider).call(
              name: _nameController.text,
              price: price,
              categoryId: _categoryId!,
              isActive: _isActive,
              imagePath: imagePath,
              id: productId,
            );
      }

      if (!mounted) {
        return;
      }
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.isEditing ? 'Menu diperbarui' : 'Menu ditambahkan'),
        ),
      );
    } on ArgumentError catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Data tidak valid')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _deleteProduct() async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Hapus menu ini?',
      message: 'Menu akan dihapus permanen.',
      confirmLabel: 'Hapus',
      isDestructive: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }
    await ref.read(deleteProductUseCaseProvider).call(widget.productId!);
    if (!mounted) {
      return;
    }
    context.pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Menu dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Ubah menu' : 'Tambah menu'),
        actions: [
          if (widget.isEditing)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
              onPressed: _deleteProduct,
            ),
          TextButton(
            onPressed: _isSaving ? null : _save,
            child: _isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Simpan'),
          ),
        ],
      ),
      body: !_formInitialized
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Foto produk', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _existingImageFile != null && !_clearImage
                        ? Image.file(
                            _existingImageFile!,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 160,
                            height: 160,
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            child: const Icon(Icons.image_outlined, size: 48),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: const Icon(Icons.photo_library_outlined),
                        label: const Text('Galeri'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: const Icon(Icons.photo_camera_outlined),
                        label: const Text('Kamera'),
                      ),
                    ),
                  ],
                ),
                if (_existingImageFile != null && !_clearImage)
                  TextButton(
                    onPressed: _removeImage,
                    child: const Text('Hapus foto'),
                  ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama menu'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Harga (Rp)',
                    prefixText: 'Rp ',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                categoriesAsync.when(
                  loading: () => const LinearProgressIndicator(),
                  error: (e, _) => Text('Kategori: $e'),
                  data: (categories) {
                    if (categories.isEmpty) {
                      return const Text('Buat kategori terlebih dahulu.');
                    }
                    _categoryId ??= categories.first.id;
                    return DropdownButtonFormField<String>(
                      initialValue: _categoryId,
                      decoration: const InputDecoration(labelText: 'Kategori'),
                      items: categories
                          .map(
                            (c) => DropdownMenuItem(
                              value: c.id,
                              child: Text(c.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() => _categoryId = value),
                    );
                  },
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Aktif'),
                  subtitle: const Text('Tampil di layar kasir'),
                  value: _isActive,
                  onChanged: (value) => setState(() => _isActive = value),
                ),
                if (_priceController.text.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Preview: ${formatRupiah(_parsePrice() ?? 0)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
    );
  }
}
