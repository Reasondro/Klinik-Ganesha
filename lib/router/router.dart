import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/screens/explore_screen.dart';
import 'package:klinik/screens/home_screen.dart';
import 'package:klinik/screens/profile_screen.dart';
import 'package:klinik/widgets/layout_scaffold.dart';
import 'package:klinik/router/routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homeScreen,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) =>
          LayoutScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.homeScreen,
                // builder: (context, state) => const HomeScreen(),
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: HomeScreen());
                }),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.exploreScreen,
                // builder: (context, state) => const ExploreScreen(),
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ExploreScreen());
                }),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.profileScreen,
                // builder: (context, state) => const ProfileScreen(),
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ProfileScreen());
                }),
          ],
        )
      ],
    )
  ],
);
