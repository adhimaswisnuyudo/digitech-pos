import '../entities/product.dart';

class CartLine {
  const CartLine({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.qty,
  });

  final String productId;
  final String productName;
  final int unitPrice;
  final int qty;

  int get lineTotal => unitPrice * qty;

  CartLine copyWith({int? qty}) {
    return CartLine(
      productId: productId,
      productName: productName,
      unitPrice: unitPrice,
      qty: qty ?? this.qty,
    );
  }

  factory CartLine.fromProduct(Product product) {
    return CartLine(
      productId: product.id,
      productName: product.name,
      unitPrice: product.price,
      qty: 1,
    );
  }
}

int cartSubtotal(List<CartLine> lines) {
  return lines.fold(0, (sum, line) => sum + line.lineTotal);
}

int cartItemCount(List<CartLine> lines) {
  return lines.fold(0, (sum, line) => sum + line.qty);
}
