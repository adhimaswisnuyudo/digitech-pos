import '../../domain/entities/app_settings.dart' as domain;
import '../../domain/enums/app_theme_preference.dart';
import '../../domain/repositories/settings_repository.dart';
import '../local/database/daos/settings_dao.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._settingsDao);

  final SettingsDao _settingsDao;

  @override
  Future<domain.AppSettings> getSettings() async {
    final row = await _settingsDao.getSettings();
    if (row == null) {
      return const domain.AppSettings(outletName: 'Outlet Saya');
    }
    return domain.AppSettings(
      outletName: row.outletName,
      receiptFooter: row.receiptFooter,
      dbSeededAt: row.dbSeededAt,
      themeMode: AppThemePreference.fromStorage(row.themeMode),
    );
  }

  @override
  Future<void> ensureDefaultSettings() {
    return _settingsDao.ensureDefaultSettings(DateTime.now().toUtc());
  }

  @override
  Future<void> updateSettings({
    required String outletName,
    String? receiptFooter,
  }) {
    return _settingsDao.updateSettings(
      outletName: outletName,
      receiptFooter: receiptFooter,
    );
  }

  @override
  Future<void> updateThemeMode(AppThemePreference themeMode) {
    return _settingsDao.updateThemeMode(themeMode.storageValue);
  }
}
