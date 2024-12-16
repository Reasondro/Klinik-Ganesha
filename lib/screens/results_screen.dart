import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          Text(
            "Laporan Konsultasi",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Hasil Konsultasi - Dr. Spesialis Jantung'),
              subtitle: const Text('Konsultasi Tgl: 20 Des 2024'),
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
              leading: const Icon(Icons.description),
              title: const Text('Hasil Konsultasi - Dr. Spesialis Paru'),
              subtitle: const Text('Konsultasi Tgl: 22 Des 2024'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Detail'),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Laporan Laboratorium",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Hasil Tes Darah Lengkap'),
              subtitle: const Text('Uji Lab Tgl: 22 Des 2024'),
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
              leading: const Icon(Icons.analytics),
              title: const Text('Hasil Tes Kolesterol'),
              subtitle: const Text('Uji Lab Tgl: 10 Des 2024'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Detail'),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
