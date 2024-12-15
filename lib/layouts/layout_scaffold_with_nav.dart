import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/models/destination.dart';
import 'package:klinik/utils/go_router_location_extension.dart';

class LayoutScaffoldWithNav extends StatelessWidget {
  const LayoutScaffoldWithNav({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
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
        selectedIndex: _calculateIndex(context),
        // selectedIndex: navigationShell.currentIndex,
        // onDestinationSelected: navigationShell.goBranch,
        onDestinationSelected: (index) {
          _onItemTapped(context, index);
        },

        // indicatorColor: Colors.amber,
      ),
    );
  }
}

int _calculateIndex(BuildContext context) {
  final location = GoRouter.of(context).location;
  if (location.startsWith('/home')) return 0;
  if (location.startsWith('/explore')) return 1;
  if (location.startsWith('/profile')) return 2;
  return 0;
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
