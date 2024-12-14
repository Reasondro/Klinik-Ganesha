import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ElevatedButton(
      //   // Again, push on top of Explore -> Profile.
      //   onPressed: () => context.push('/profile'),
      //   child: const Text('Go to Profile'),
      // ),
      child: Text("Explore"),
    );
  }
}
