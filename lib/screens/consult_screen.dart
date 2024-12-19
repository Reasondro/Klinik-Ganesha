import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:klinik/database/feeds_consult_database.dart';
import 'package:klinik/models/feed_consult.dart';
import 'package:klinik/router/routes.dart';
import 'package:klinik/widgets/consult_event.dart';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({super.key});

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  final feedsConsultDatabase = FeedsConsultDatabase();
  void cancelAppointment(FeedConsult feedConsult) {
    feedsConsultDatabase.deleteFeedConsult(feedConsult);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16.0, left: 16.0),
      child: StreamBuilder(
        stream: feedsConsultDatabase.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<FeedConsult> feedsConsult = snapshot.data!;
          if (feedsConsult.isEmpty) {
            return Center(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.push(Routes.nestedDoctorsScreen);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Konsultasi Offline'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // context.push(Routes.nestedDoctorsScreen);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Konsultasi Online'),
                  ),
                ],
              ),
            );
          }
          return Column(
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.push(Routes.nestedDoctorsScreen);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Konsultasi Offline'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // context.push(Routes.nestedDoctorsScreen);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Konsultasi Online'),
                  ),
                ],
              ),
              Text(
                "Janji konsultasi mendatang Anda",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: feedsConsult.length,
                  itemBuilder: (context, index) {
                    final feedConsult = feedsConsult[index];
                    return ConsultEvent(
                      feedConsult: feedConsult,
                      onCancel: () {
                        cancelAppointment(feedConsult);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      // ListView(
      //   children: [
      //     Text(
      //       "Janji Konsultasi Anda",
      //       style: Theme.of(context).textTheme.titleMedium,
      //       textAlign: TextAlign.start,
      //     ),
      //     const SizedBox(height: 16),
      //     Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: ListTile(
      //         leading: const Icon(Icons.calendar_today),
      //         title: const Text('Konsultasi Dengan Dr. Spesialis Jantung'),
      //         subtitle: const Text('Senin, 20 Des 2024 - 10:00 AM'),
      //         trailing: ElevatedButton(
      //           onPressed: () {},
      //           child: const Text('Detail'),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 8),
      //     Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: ListTile(
      //         leading: const Icon(Icons.calendar_today),
      //         title: const Text('Konsultasi Dengan Dr. Spesialis Paru'),
      //         subtitle: const Text('Rabu, 22 Des 2024 - 09:00 AM'),
      //         trailing: ElevatedButton(
      //           onPressed: () {},
      //           child: const Text('Detail'),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 16),
      //     Row(
      //       spacing: 10,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ElevatedButton.icon(
      //           onPressed: () {
      //             context.push(Routes.nestedDoctorsScreen);
      //           },
      //           icon: const Icon(Icons.add),
      //           label: const Text('Konsultasi Offline'),
      //         ),
      //         ElevatedButton.icon(
      //           onPressed: () {
      //             // context.push(Routes.nestedDoctorsScreen);
      //           },
      //           icon: const Icon(Icons.add),
      //           label: const Text('Konsultasi Online'),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(height: 16),
      //     Text(
      //       "Riwayat Konsultasi",
      //       style: Theme.of(context).textTheme.titleMedium,
      //       textAlign: TextAlign.start,
      //     ),
      //     const SizedBox(height: 16),
      //     Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: ListTile(
      //         leading: const Icon(Icons.history),
      //         title: const Text('Konsultasi Dengan Dr. Spesialis Saraf'),
      //         subtitle: const Text('Selesai: 10 Des 2024 - 14:00 PM'),
      //         // trailing: ElevatedButton(
      //         //   onPressed: () {},
      //         //   child: const Text('Laporan'),
      //         // ),
      //       ),
      //     ),
      //     const SizedBox(height: 8),
      //     Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: ListTile(
      //         leading: const Icon(Icons.history),
      //         title: const Text('Konsultasi Dengan Dr. Spesialis Kulit'),
      //         subtitle: const Text('Selesai: 5 Des 2024 - 11:00 AM'),
      //         // trailing: ElevatedButton(
      //         //   onPressed: () {},
      //         //   child: const Text('Laporan'),
      //         // ),
      //       ),
      //     ),
      //     const SizedBox(height: 16),
      //   ],
      // ),
    );
  }
}
