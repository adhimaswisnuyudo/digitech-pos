import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers/app_providers.dart';
import 'core/theme/app_theme.dart';
import 'presentation/features/settings/settings_providers.dart';
import 'presentation/routing/app_router.dart';

final _router = createAppRouter();

class CashierApp extends ConsumerWidget {
  const CashierApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(initializeAppProvider);
    final themeMode = ref.watch(themeModeProvider);

    Widget buildRouterApp() {
      return MaterialApp.router(
        title: 'Cashier POS',
        theme: buildAppTheme(Brightness.light),
        darkTheme: buildAppTheme(Brightness.dark),
        themeMode: themeMode,
        locale: const Locale('id', 'ID'),
        supportedLocales: const [Locale('id', 'ID')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: _router,
      );
    }

    return init.when(
      loading: () => MaterialApp(
        theme: buildAppTheme(Brightness.light),
        darkTheme: buildAppTheme(Brightness.dark),
        themeMode: themeMode,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, _) => MaterialApp(
        theme: buildAppTheme(Brightness.light),
        darkTheme: buildAppTheme(Brightness.dark),
        themeMode: themeMode,
        home: Scaffold(
          body: Center(child: Text('Gagal memuat data: $error')),
        ),
      ),
      data: (_) => buildRouterApp(),
    );
  }
}
