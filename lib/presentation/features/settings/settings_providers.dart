import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_cases/delete_demo_products.dart';
import '../../../application/use_cases/update_settings.dart';
import '../../../application/use_cases/update_theme_mode.dart';
import '../../../core/providers/app_providers.dart';
import '../../../domain/entities/app_settings.dart';

final appSettingsProvider = FutureProvider<AppSettings>((ref) async {
  await ref.watch(initializeAppProvider.future);
  return ref.watch(settingsRepositoryProvider).getSettings();
});

final themeModeProvider = Provider<ThemeMode>((ref) {
  final settings = ref.watch(appSettingsProvider);
  return settings.maybeWhen(
    data: (value) =>
        value.themeMode.isDark ? ThemeMode.dark : ThemeMode.light,
    orElse: () => ThemeMode.light,
  );
});

final updateSettingsUseCaseProvider = Provider<UpdateSettings>((ref) {
  return UpdateSettings(ref.watch(settingsRepositoryProvider));
});

final updateThemeModeUseCaseProvider = Provider<UpdateThemeMode>((ref) {
  return UpdateThemeMode(ref.watch(settingsRepositoryProvider));
});

final deleteDemoProductsUseCaseProvider = Provider<DeleteDemoProducts>((ref) {
  return DeleteDemoProducts(ref.watch(productRepositoryProvider));
});
