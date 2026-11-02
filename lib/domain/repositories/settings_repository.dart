import '../entities/app_settings.dart';
import '../enums/app_theme_preference.dart';

abstract class SettingsRepository {
  Future<AppSettings> getSettings();

  Future<void> ensureDefaultSettings();

  Future<void> updateSettings({
    required String outletName,
    String? receiptFooter,
  });

  Future<void> updateThemeMode(AppThemePreference themeMode);
}
