import '../../data/local/seed/demo_seeder.dart';
import '../../domain/repositories/settings_repository.dart';

class InitializeApp {
  InitializeApp({
    required this.settingsRepository,
    required this.demoSeeder,
  });

  final SettingsRepository settingsRepository;
  final DemoSeeder demoSeeder;

  Future<void> call() async {
    await settingsRepository.ensureDefaultSettings();
    await demoSeeder.seedIfEmpty();
  }
}
