import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_version.dart';
import '../../../domain/entities/app_settings.dart';
import '../../../domain/enums/app_theme_preference.dart';
import '../../shared/confirm_dialog.dart';
import 'settings_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _outletController = TextEditingController();
  final _footerController = TextEditingController();
  bool _controllersInitialized = false;
  bool _isSaving = false;
  bool _isDeletingDemo = false;
  bool _isUpdatingTheme = false;

  @override
  void dispose() {
    _outletController.dispose();
    _footerController.dispose();
    super.dispose();
  }

  void _syncControllers(AppSettings settings) {
    if (_controllersInitialized) {
      return;
    }
    _outletController.text = settings.outletName;
    _footerController.text = settings.receiptFooter ?? '';
    _controllersInitialized = true;
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      await ref.read(updateSettingsUseCaseProvider).call(
            outletName: _outletController.text,
            receiptFooter: _footerController.text,
          );
      ref.invalidate(appSettingsProvider);
      _controllersInitialized = false;
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengaturan disimpan')),
      );
    } on ArgumentError catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Data tidak valid')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _setThemeDark(bool enabled) async {
    setState(() => _isUpdatingTheme = true);
    try {
      await ref.read(updateThemeModeUseCaseProvider).call(
            enabled ? AppThemePreference.dark : AppThemePreference.light,
          );
      ref.invalidate(appSettingsProvider);
    } finally {
      if (mounted) {
        setState(() => _isUpdatingTheme = false);
      }
    }
  }

  Future<void> _deleteDemoData() async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Hapus data demo?',
      message:
          'Semua menu bertanda Demo akan dihapus. Transaksi tidak terpengaruh.',
      confirmLabel: 'Hapus',
      isDestructive: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }

    setState(() => _isDeletingDemo = true);
    try {
      final deleted = await ref.read(deleteDemoProductsUseCaseProvider).call();
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            deleted > 0
                ? '$deleted menu demo dihapus'
                : 'Tidak ada menu demo',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isDeletingDemo = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        actions: [
          TextButton(
            onPressed: _isSaving || settingsAsync.isLoading ? null : _save,
            child: _isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Simpan'),
          ),
        ],
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Gagal memuat: $error')),
        data: (settings) {
          _syncControllers(settings);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Outlet', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextField(
                controller: _outletController,
                decoration: const InputDecoration(
                  labelText: 'Nama outlet',
                  hintText: 'Outlet Saya',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24),
              Text('Struk', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextField(
                controller: _footerController,
                decoration: const InputDecoration(
                  labelText: 'Footer struk (opsional)',
                  alignLabelWithHint: true,
                ),
                maxLength: 200,
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              Text('Tampilan', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Tema gelap'),
                subtitle: Text(
                  settings.themeMode.isDark
                      ? 'Mode gelap aktif'
                      : 'Mode terang aktif',
                ),
                value: settings.themeMode.isDark,
                onChanged: _isUpdatingTheme ? null : _setThemeDark,
              ),
              const SizedBox(height: 32),
              Text('Data', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Hapus data demo'),
                subtitle: const Text('Hanya menu contoh, bukan transaksi'),
                trailing: _isDeletingDemo
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: _isDeletingDemo ? null : _deleteDemoData,
              ),
              const Divider(height: 32),
              Text('Tentang', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Versi aplikasi'),
                subtitle: Text(appVersionLabel),
              ),
            ],
          );
        },
      ),
    );
  }
}
