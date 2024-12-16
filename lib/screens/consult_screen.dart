import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:klinik/router/routes.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
      child: ListView(
        children: [
          Text(
            "Janji Konsultasi Anda",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Konsultasi Dengan Dr. Spesialis Jantung'),
              subtitle: const Text('Senin, 20 Des 2024 - 10:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {
                  //? TODO detail atau reschedule
                },
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
              leading: const Icon(Icons.calendar_today),
              title: const Text('Konsultasi Dengan Dr. Spesialis Paru'),
              subtitle: const Text('Rabu, 22 Des 2024 - 09:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Detail'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Riwayat Konsultasi",
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
              title: const Text('Konsultasi Dengan Dr. Spesialis Saraf'),
              subtitle: const Text('Selesai: 10 Des 2024 - 14:00 PM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Laporan'),
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
              title: const Text('Konsultasi Dengan Dr. Spesialis Kulit'),
              subtitle: const Text('Selesai: 5 Des 2024 - 11:00 AM'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Laporan'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                context.push(Routes.nestedNoteScreen);
              },
              icon: const Icon(Icons.add),
              label: const Text('Buat Janji Konsultasi Baru'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
