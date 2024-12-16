import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

const destinations = [
  Destination(label: "Home", icon: Icons.home),
  // Destination(label: "Explore", icon: Icons.search),
  Destination(label: "Consult", icon: Icons.badge),
  Destination(label: "Lab", icon: Icons.vaccines),
  Destination(label: "Results", icon: Icons.assignment),
  Destination(label: "Profile", icon: Icons.person),
];
