import 'package:flutter/material.dart';

/// Tablet landscape: menu kiri, keranjang kanan.
bool cashierUseSplitLayout(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final isLandscape = size.width > size.height;
  return isLandscape && size.width >= 720;
}

int cashierGridCrossAxisCount(double maxWidth) {
  const minTileWidth = 132.0;
  return maxWidth < minTileWidth * 2
      ? 2
      : (maxWidth / minTileWidth).floor().clamp(2, 6);
}

double cashierGridMainAxisExtent(double tileWidth) {
  const textBlockHeight = 76.0;
  return tileWidth + textBlockHeight;
}
