import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          Text(
            "Jadwal Uji Laboratorium Anda",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
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
                child: const Text('Detail'),
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
              title: const Text('Tes Urin Lengkap'),
              subtitle: const Text('Jumat, 24 Des 2024 - 09:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Detail'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Riwayat Uji Laboratorium",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Tes Kolesterol'),
              subtitle: const Text('Selesai: 10 Des 2024 - 07:30 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Lihat Hasil'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Tes Gula Darah'),
              subtitle: const Text('Selesai: 05 Des 2024 - 07:30 AM'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Aksi untuk melihat hasil lab lama
                },
                child: const Text('Lihat Hasil'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Buat Janji Uji Lab Baru'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
