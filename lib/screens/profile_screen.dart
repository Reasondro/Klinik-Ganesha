import 'package:flutter/material.dart';
import 'package:klinik/auth/auth_service.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//           onPressed: () {
//             AuthService().signOut();
//           },
//           child: Icon(Icons.exit_to_app)),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userEmail =
        AuthService.supabase.auth.currentUser!.email ?? "User Email";
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),

          // Foto Profil
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/default_profile.png'),
              // bisa diganti sesuai sumber foto profil user
            ),
          ),
          const SizedBox(height: 8),

          // Nama pengguna
          Center(
            child: Text(
              'Alessandro Jusack H.',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),

          Center(
            child: Text(
              "Email: $userEmail",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(height: 16),

          Divider(),
          const SizedBox(height: 8),

          Text(
            "Pengaturan & Informasi",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Pengaturan Notifikasi'),
              subtitle: const Text('Atur preferensi notifikasi Anda'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Bantuan'),
              subtitle: const Text('FAQ, kontak layanan pelanggan'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              subtitle: const Text('Informasi versi & developer'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              onPressed: () {
                AuthService().signOut();
              },
              child: const Text('Sign out'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
