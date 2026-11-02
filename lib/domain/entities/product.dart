class Product {
  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.isActive,
    required this.isDemo,
    this.imagePath,
  });

  final String id;
  final String categoryId;
  final String name;
  final int price;
  final bool isActive;
  final bool isDemo;
  final String? imagePath;
}

class ProductListItem {
  const ProductListItem({
    required this.product,
    required this.categoryName,
  });

  final Product product;
  final String categoryName;
}
