import '../../domain/enums/app_theme_preference.dart';
import '../../domain/repositories/settings_repository.dart';

class UpdateThemeMode {
  UpdateThemeMode(this._settingsRepository);

  final SettingsRepository _settingsRepository;

  Future<void> call(AppThemePreference themeMode) {
    return _settingsRepository.updateThemeMode(themeMode);
  }
}
