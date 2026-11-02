class CategoryHasProductsException implements Exception {
  CategoryHasProductsException([
    this.message = 'Kategori masih memiliki produk',
  ]);

  final String message;

  @override
  String toString() => message;
}
