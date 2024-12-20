import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/screens/auth_screen.dart';
import 'package:klinik/screens/consult_screen.dart';
import 'package:klinik/screens/doctors_screen.dart';

import 'package:klinik/screens/home_screen.dart';
import 'package:klinik/screens/lab_screen.dart';
import 'package:klinik/screens/profile_screen.dart';
import 'package:klinik/layouts/layout_scaffold_with_nav.dart';
import 'package:klinik/router/routes.dart';
import 'package:klinik/screens/results_screen.dart';
// import 'package:klinik/temp/note_screen.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:klinik/utils/go_router_location_extension.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class RoutingService {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeScreen,
    redirect: (BuildContext context, GoRouterState state) {
      final bool signedOut = Supabase.instance.client.auth.currentUser == null;
      final bool signingIn = state.matchedLocation == "/auth";

      // ? testing ⬇️⬇️⬇️⬇️⬇️
      // print(" Who is it: ${Supabase.instance.client.auth.currentUser}");
      // print("curr matched loc from routing_service: ${state.matchedLocation}");

      if (signedOut) {
        // ? testing ⬇️⬇️⬇️⬇️⬇️
        // print("curr matched loc from signedOut cond: ${state.matchedLocation}");
        return Routes.authScreen;
      }

      if (signingIn) {
        // ? testing ⬇️⬇️⬇️⬇️⬇️
        // print("curr matched loc from signingIn cond: ${state.matchedLocation}");
        return Routes.homeScreen;
      }
      // ? testing ⬇️⬇️⬇️⬇️⬇️
      // print("curr matched loc from nothing cond: ${state.matchedLocation}");

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) =>
            LayoutScaffoldWithNav(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "Home",
                path: Routes.homeScreen,
                // builder: (context, state) => const HomeScreen(),
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: HomeScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              name: "Consult",
              path: Routes.consultScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ConsultScreen());
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: Routes.doctorsScreen,
                  builder: (context, state) => DoctorsScreen(),
                )
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: "Lab",
                path: Routes.labScreen,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: LabScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: "Results",
                path: Routes.resultsScreen,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ResultsScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: "Profile",
                path: Routes.profileScreen,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ProfileScreen());
                  // return NoTransitionPage(child: NoteScreen());
                }),
          ])
        ],
      ),
      GoRoute(
          path: Routes.authScreen,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: AuthScreen());
          })
    ],
  );
}
