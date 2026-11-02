enum AppThemePreference {
  light,
  dark;

  String get storageValue => name;

  static AppThemePreference fromStorage(String? value) {
    return value == dark.storageValue ? dark : light;
  }

  bool get isDark => this == dark;
}
