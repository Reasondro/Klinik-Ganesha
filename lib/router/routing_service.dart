import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/screens/explore_screen.dart';
import 'package:klinik/screens/home_screen.dart';
import 'package:klinik/screens/profile_screen.dart';
import 'package:klinik/layouts/layout_scaffold_with_nav.dart';
import 'package:klinik/router/routes.dart';
import 'package:klinik/screens/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class RoutingService {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeScreen,
    redirect: (BuildContext context, GoRouterState state) {
      // Supabase.instance.client.auth.onAuthStateChange.listen(
      //   (data) {
      //     if (data.event == AuthChangeEvent.signedOut) {
      //       return "/signIn";
      //     } else {
      //       return null;
      //     }
      //   },
      // );
      final bool signedOut = Supabase.instance.client.auth.currentUser == null;
      if (signedOut) {
        return "/signIn";
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            LayoutScaffoldWithNav(child: child),
        routes: [
          GoRoute(
              path: Routes.signInScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SignInScreen());
              }),
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
}
