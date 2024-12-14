import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/models/destination.dart';

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
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Colors.amber,
      ),
    );
  }
}
