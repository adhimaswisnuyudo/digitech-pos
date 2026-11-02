import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/cashier/cashier_screen.dart';
import '../features/menu/categories/categories_screen.dart';
import '../features/menu/menu_screen.dart';
import '../features/menu/products/product_form_screen.dart';
import '../features/reports/reports_placeholder_screen.dart';
import '../features/settings/settings_screen.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.point_of_sale_outlined),
            selectedIcon: Icon(Icons.point_of_sale),
            label: 'Kasir',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.assessment_outlined),
            selectedIcon: Icon(Icons.assessment),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

List<StatefulShellBranch> get _shellBranches => [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/cashier',
            builder: (context, state) => const CashierScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/menu',
            builder: (context, state) => const MenuScreen(),
            routes: [
              GoRoute(
                path: 'categories',
                builder: (context, state) => const CategoriesScreen(),
              ),
              GoRoute(
                path: 'product/new',
                builder: (context, state) => const ProductFormScreen(),
              ),
              GoRoute(
                path: 'product/:id',
                builder: (context, state) => ProductFormScreen(
                  productId: state.pathParameters['id'],
                ),
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsPlaceholderScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ];

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/cashier',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: _shellBranches,
      ),
    ],
  );
}
