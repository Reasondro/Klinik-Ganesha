import 'package:flutter/material.dart';
import 'package:klinik/auth/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: Icon(Icons.exit_to_app)),
    );
  }
}
