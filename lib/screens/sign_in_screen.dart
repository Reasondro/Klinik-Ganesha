import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ElevatedButton(
      //   // Using push here adds to the stack. So we go Home -> Search.
      //   onPressed: () => context.push('/search'),
      //   child: const Text('Go to Search'),
      // ),
      child: Text("Sign In here"),
    );
  }
}
