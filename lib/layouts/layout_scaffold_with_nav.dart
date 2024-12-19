import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/models/destination.dart';
import 'package:klinik/router/routes.dart';
import 'package:klinik/utils/go_router_location_extension.dart';

class LayoutScaffoldWithNav extends StatelessWidget {
  const LayoutScaffoldWithNav({super.key, required this.navigationShell});

  // final Widget child;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    AppBar appBar;

    switch (GoRouter.of(context).location) {
      case Routes.homeScreen:
        appBar = AppBar(
          title: Text("Home"),
        );
        break;
      case Routes.consultScreen:
        appBar = AppBar(
          title: Text("Consult"),
        );
        break;
      case Routes.labScreen:
        appBar = AppBar(
          title: Text("Lab"),
        );
        break;
      case Routes.resultsScreen:
        appBar = AppBar(
          title: Text("Results"),
        );
        break;

      case Routes.profileScreen:
        appBar = AppBar(
          title: Text("Profile"),
        );
        break;
      default:
        appBar = AppBar(
          title: Text(""),
        );
    }

    return Scaffold(
      appBar: appBar,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                label: d.label,
                selectedIcon: Icon(
                  d.icon,
                ),
              ),
            )
            .toList(),
        // selectedIndex: _calculateIndex(context),
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        // onDestinationSelected: (index) {
        //   _onItemTapped(context, index);
        // },

        // indicatorColor: Colors.amber,
      ),
    );
  }
}

// int _calculateIndex(BuildContext context) {
//   final location = GoRouter.of(context).location;
//   if (location.startsWith(Routes.homeScreen)) return 0;
//   if (location.startsWith(Routes.consultScreen)) return 1;
//   if (location.startsWith(Routes.labScreen)) return 2;
//   if (location.startsWith(Routes.resultsScreen)) return 3;
//   if (location.startsWith(Routes.profileScreen)) return 4;

//   return 0;
// }

// void _onItemTapped(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       context.push(Routes.homeScreen);
//       // print('Current route: ${GoRouter.of(context).location}');
//       break;
//     case 1:
//       context.push(Routes.consultScreen);
//       break;
//     case 2:
//       context.push(Routes.labScreen);
//       break;
//     case 3:
//       context.push(Routes.resultsScreen);
//       break;
//     case 4:
//       context.push(Routes.profileScreen);
//       break;
//   }
// }
