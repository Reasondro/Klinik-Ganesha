import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ElevatedButton(
      //   // Using push here adds to the stack. So we go Home -> Search.
      //   onPressed: () => context.push('/search'),
      //   child: const Text('Go to Search'),
      // ),
      child: Text("Home"),
    );
  }
}
