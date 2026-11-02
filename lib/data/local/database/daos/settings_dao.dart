import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/app_settings_table.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [AppSettingsTable])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  static const defaultSettingsId = 1;

  Future<AppSettingsRow?> getSettings() {
    return (db.select(db.appSettingsTable)
          ..where((t) => t.id.equals(defaultSettingsId)))
        .getSingleOrNull();
  }

  Future<void> ensureDefaultSettings(DateTime now) async {
    final existing = await getSettings();
    if (existing != null) {
      return;
    }
    await db.into(db.appSettingsTable).insert(
          AppSettingsTableCompanion.insert(
            id: const Value(defaultSettingsId),
            updatedAt: now,
          ),
        );
  }

  Future<void> markDbSeeded(DateTime seededAt) async {
    await (db.update(db.appSettingsTable)
          ..where((t) => t.id.equals(defaultSettingsId)))
        .write(
      AppSettingsTableCompanion(
        dbSeededAt: Value(seededAt),
        updatedAt: Value(seededAt),
      ),
    );
  }

  Future<void> updateSettings({
    required String outletName,
    String? receiptFooter,
  }) async {
    final now = DateTime.now().toUtc();
    final trimmedFooter = receiptFooter?.trim();
    await (db.update(db.appSettingsTable)
          ..where((t) => t.id.equals(defaultSettingsId)))
        .write(
      AppSettingsTableCompanion(
        outletName: Value(outletName.trim()),
        receiptFooter: trimmedFooter == null || trimmedFooter.isEmpty
            ? const Value.absent()
            : Value(trimmedFooter),
        updatedAt: Value(now),
      ),
    );
  }

  Future<void> updateThemeMode(String themeMode) async {
    final now = DateTime.now().toUtc();
    await (db.update(db.appSettingsTable)
          ..where((t) => t.id.equals(defaultSettingsId)))
        .write(
      AppSettingsTableCompanion(
        themeMode: Value(themeMode),
        updatedAt: Value(now),
      ),
    );
  }
}
