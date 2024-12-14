import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/models/destination.dart';
import 'package:klinik/utils/go_router_location_extension.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                label: d.label,
                selectedIcon: Icon(
                  d.icon,
                  color: Colors.greenAccent,
                ),
              ),
            )
            .toList(),
        // selectedIndex: navigationShell.currentIndex,
        selectedIndex: navigationShell.currentIndex,
        // onDestinationSelected: navigationShell.goBranch,
        onDestinationSelected: (index) {
          _onItemTapped(context, index);
        },

        indicatorColor: Colors.amber,
      ),
    );
  }
}

void _onItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.push('/home');
      print('Current route: ${GoRouter.of(context).location}');
      break;
    case 1:
      context.push('/explore');
      print('Current route: ${GoRouter.of(context).location}');
      break;
    case 2:
      context.push('/profile');
      print('Current route: ${GoRouter.of(context).location}');
      break;
  }
}
