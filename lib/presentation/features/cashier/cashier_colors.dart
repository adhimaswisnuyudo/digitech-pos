import 'package:flutter/material.dart';

/// Palet identitas Canzy — hanya dipakai di layar kasir.
abstract final class CashierColors {
  static const chocolate = Color(0xFF4E342E);
  static const chocolateDark = Color(0xFF3E2723);
  static const cream = Color(0xFFF5F0E6);
  static const creamMuted = Color(0xFFEDE6DA);
  static const chipInactive = Color(0xFFFFFFFF);
  static const categoryPill = Color(0xFFD7CCC8);
  static const categoryPillText = Color(0xFF5D4037);
}

ThemeData cashierLocalTheme(BuildContext context) {
  final base = Theme.of(context);
  return base.copyWith(
    scaffoldBackgroundColor: CashierColors.cream,
    colorScheme: base.colorScheme.copyWith(
      primary: CashierColors.chocolate,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: CashierColors.chocolateDark,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: CashierColors.chocolate,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: CashierColors.chocolate, width: 1.5),
      ),
    ),
  );
}

IconData cashierCategoryIcon(String name) {
  final key = name.toLowerCase();
  if (key == 'semua') return Icons.grid_view_rounded;
  if (key.contains('kopi') || key.contains('coffee')) {
    return Icons.local_cafe_outlined;
  }
  if (key.contains('bakery') || key.contains('roti')) {
    return Icons.bakery_dining_outlined;
  }
  if (key.contains('pastry') || key.contains('kue')) {
    return Icons.cake_outlined;
  }
  if (key.contains('makanan') || key.contains('food')) {
    return Icons.restaurant_outlined;
  }
  return Icons.category_outlined;
}
