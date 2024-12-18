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
import 'package:klinik/temp/note_screen.dart';

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

      // print(" Who is it: ${Supabase.instance.client.auth.currentUser}");
      // print("curr matched loc from routing_service: ${state.matchedLocation}");

      if (signedOut) {
        // print("curr matched loc from signedOut cond: ${state.matchedLocation}");
        return Routes.authScreen;
      }

      if (signingIn) {
        // print("curr matched loc from signingIn cond: ${state.matchedLocation}");
        return Routes.homeScreen;
      }
      // print("curr matched loc from nothing cond: ${state.matchedLocation}");

      return null;
    },
    routes: [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            LayoutScaffoldWithNav(child: child),
        routes: [
          GoRoute(
            name: "Home",
            path: Routes.homeScreen,
            // builder: (context, state) => const HomeScreen(),
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomeScreen());
            },
          ),
          GoRoute(
            name: "Consult",
            path: Routes.consultScreen,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: ConsultScreen());
            },
            routes: [
              GoRoute(
                // parentNavigatorKey: _rootNavigatorKey,
                // path: Routes.noteScreen,
                // builder: (context, state) => NoteScreen(),
                parentNavigatorKey: _rootNavigatorKey,
                path: Routes.doctorsScreen,
                builder: (context, state) => DoctorsScreen(),
              )
            ],
          ),
          GoRoute(
              name: "Lab",
              path: Routes.labScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: LabScreen());
              }),
          GoRoute(
              name: "Results",
              path: Routes.resultsScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ResultsScreen());
              }),
          // GoRoute(
          //     name: "Explore",
          //     path: Routes.exploreScreen,
          //     pageBuilder: (context, state) {
          //       return NoTransitionPage(child: ExploreScreen());
          //     }),
          GoRoute(
              name: "Profile",
              path: Routes.profileScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ProfileScreen());
              }),
        ],
      ),
      // GoRoute(
      //     path: Routes.signInScreen,
      //     pageBuilder: (context, state) {
      //       return NoTransitionPage(child: SignInScreen());
      //     }),
      // GoRoute(
      //     path: Routes.signUpScreen,
      //     pageBuilder: (context, state) {
      //       return NoTransitionPage(child: SignUpScreen());
      //     }),
      GoRoute(
          path: Routes.authScreen,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: AuthScreen());
          })
    ],
  );
}
