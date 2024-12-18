import 'package:flutter/material.dart';
import 'package:klinik/auth/auth_service.dart';
import 'package:klinik/models/doctor.dart';
import 'package:klinik/models/feed_consult.dart';
import 'package:klinik/database/feeds_consult_database.dart';
import 'package:uuid/uuid.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final feedsConsultDatabase = FeedsConsultDatabase();

    void makeAppointment(FeedConsult newFeedConsult) async {
      feedsConsultDatabase.createFeedConsult(newFeedConsult);
    }

    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      const AssetImage('assets/images/doctor_placeholder.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.nameTitle,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Spesialisasi: ${doctor.specialize}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Informasi hari
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${doctor.dayStart} - ${doctor.dayEnd}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Informasi jam
            Row(
              children: [
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${doctor.timeStart} - ${doctor.timeEnd}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tombol Buat Janji
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onPressed: () {
                    final userId = AuthService().getCurrentUserId();
                    final category = "Konsultasi Offline";
                    final doctorId = doctor.id;
                    final doctorName = doctor.nameTitle;
                    final consultTime = doctor.timeStart;
                    final consultDay = doctor.dayStart;
                    final desc = "Medical checkup: ${doctor.specialize}";

                    final newFeedConsult = FeedConsult(
                        userId: userId!,
                        category: category,
                        doctorId: doctorId,
                        doctorName: doctorName,
                        desc: desc,
                        consultTime: consultTime,
                        consultDay: consultDay);
                    makeAppointment(newFeedConsult);
                  },
                  child: Text(
                    'Buat Janji',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
