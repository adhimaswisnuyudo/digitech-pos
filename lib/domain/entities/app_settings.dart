import '../enums/app_theme_preference.dart';

class AppSettings {
  const AppSettings({
    required this.outletName,
    this.receiptFooter,
    this.dbSeededAt,
    this.themeMode = AppThemePreference.light,
  });

  final String outletName;
  final String? receiptFooter;
  final DateTime? dbSeededAt;
  final AppThemePreference themeMode;
}
