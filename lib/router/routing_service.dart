import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/screens/auth_screen.dart';
import 'package:klinik/screens/explore_screen.dart';
import 'package:klinik/screens/home_screen.dart';
import 'package:klinik/screens/profile_screen.dart';
import 'package:klinik/layouts/layout_scaffold_with_nav.dart';
import 'package:klinik/router/routes.dart';
import 'package:klinik/screens/sign_in_screen.dart';
import 'package:klinik/screens/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:klinik/utils/go_router_location_extension.dart';

final x = ChangeNotifier();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class RoutingService {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeScreen,
    redirect: (BuildContext context, GoRouterState state) {
      final bool signedOut = Supabase.instance.client.auth.currentUser == null;
      print(" Who is it: ${Supabase.instance.client.auth.currentUser}");
      if (signedOut) {
        return Routes.authScreen;
      }
      // if (!signedOut) {
      //   return Routes.homeScreen;
      // }

      // if (signingIn) {
      //   return Routes.homeScreen;
      // }

      return null;
    },
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
            },
          ),
          GoRoute(
              path: Routes.exploreScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ExploreScreen());
              }),
          GoRoute(
              path: Routes.profileScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ProfileScreen());
              }),
        ],
      ),
      GoRoute(
          path: Routes.signInScreen,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: SignInScreen());
          }),
      GoRoute(
          path: Routes.signUpScreen,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: SignUpScreen());
          }),
      GoRoute(
          path: Routes.authScreen,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: AuthScreen());
          })
    ],
  );
}
