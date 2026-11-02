import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../data/local/storage/product_image_storage.dart';

class ProductSquareImage extends StatelessWidget {
  const ProductSquareImage({
    super.key,
    required this.imagePath,
    required this.imageStorage,
    this.borderRadius = 12,
  });

  final String? imagePath;
  final ProductImageStorage imageStorage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: FutureBuilder<File?>(
          future: imageStorage.resolveFile(imagePath),
          builder: (context, snapshot) {
            final file = snapshot.data;
            if (file != null) {
              return Image.file(
                file,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            }
            return ColoredBox(
              color: colorScheme.surfaceContainerHighest,
              child: Center(
                child: Icon(
                  Icons.restaurant_outlined,
                  size: 40,
                  color: colorScheme.outline,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
