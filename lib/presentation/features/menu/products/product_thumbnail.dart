import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../data/local/storage/product_image_storage.dart';
import '../../../../domain/entities/product.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({
    super.key,
    required this.product,
    required this.imageStorage,
    this.radius = 24,
  });

  final Product product;
  final ProductImageStorage imageStorage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: imageStorage.resolveFile(product.imagePath),
      builder: (context, snapshot) {
        final file = snapshot.data;
        if (file != null) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: FileImage(file),
          );
        }
        return CircleAvatar(
          radius: radius,
          child: Icon(Icons.restaurant, size: radius),
        );
      },
    );
  }
}
