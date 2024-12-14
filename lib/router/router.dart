import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/screens/explore_screen.dart';
import 'package:klinik/screens/home_screen.dart';
import 'package:klinik/screens/profile_screen.dart';
import 'package:klinik/layouts/layout_scaffold_with_nav.dart';
import 'package:klinik/router/routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homeScreen,
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          LayoutScaffoldWithNav(child: child),
      routes: [
        GoRoute(
            path: Routes.homeScreen,
            // builder: (context, state) => const HomeScreen(),
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomeScreen());
            }),
        GoRoute(
            path: Routes.exploreScreen,
            // builder: (context, state) => const ExploreScreen(),
            pageBuilder: (context, state) {
              return NoTransitionPage(child: ExploreScreen());
            }),
        GoRoute(
            path: Routes.profileScreen,
            // builder: (context, state) => const ProfileScreen(),
            pageBuilder: (context, state) {
              return NoTransitionPage(child: ProfileScreen());
            }),
      ],
    )
  ],
);
