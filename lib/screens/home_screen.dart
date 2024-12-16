import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/auth/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO natni change with username
  // TODO pastiin hrus punya display name dulu
  final String? username =
      AuthService.supabase.auth.currentUser!.email ?? "Username";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          Text(
            "Selamat Sore, $username ",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Dr. Spesialis Jantung'),
              subtitle: const Text('Senin, 20 Des 2024 - 10:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Lihat Detail'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.biotech),
              title: const Text('Tes Darah Lengkap'),
              subtitle: const Text('Rabu, 22 Des 2024 - 08:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Lihat Detail'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Hasil Konsultasi Terbaru'),
              subtitle: const Text('Tinjau hasil dan saran dari dr.ganteng123'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Lihat'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Hasil Lab Telah Tersedia'),
              subtitle: const Text('Cek hasil uji lab jantung lengkap Anda'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Lihat'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
