import '../../domain/repositories/settings_repository.dart';

class UpdateSettings {
  UpdateSettings(this._settingsRepository);

  final SettingsRepository _settingsRepository;

  Future<void> call({
    required String outletName,
    String? receiptFooter,
  }) {
    final trimmedName = outletName.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Nama outlet wajib diisi');
    }
    final footer = receiptFooter?.trim();
    if (footer != null && footer.length > 200) {
      throw ArgumentError('Footer struk maksimal 200 karakter');
    }
    return _settingsRepository.updateSettings(
      outletName: trimmedName,
      receiptFooter: footer,
    );
  }
}
