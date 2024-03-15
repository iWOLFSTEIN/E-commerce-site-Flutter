import 'package:e_commerce_site/features/home_page/presentation/pages/home.dart';
import 'package:e_commerce_site/features/home_page/presentation/pages/item_detail_page.dart';
import 'package:e_commerce_site/features/home_page/presentation/pages/items_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static String itemsPage = 'itemsPage';
  static String itemDetailPage = 'itemDetailPage';

  static int itemsPageId = 0;
  static int itemDetailPageId = 1;

  static String initial = "/$itemsPage";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            int id = itemsPageId;
            if (state.name == itemsPage) {
              id = itemsPageId;
            } else if (state.name == itemDetailPage) {
              id = itemDetailPageId;
            }
            return Home(id: id);
          },
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: itemsPage,
              path: '/$itemsPage',
              builder: (context, state) {
                return const ItemsPage();
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: itemDetailPage,
              path: '/$itemDetailPage',
              builder: (context, state) {
                return const ItemDetailPage();
              },
            )
          ]),
    ],
  );
}
