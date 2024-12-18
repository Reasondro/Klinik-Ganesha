import 'package:flutter/material.dart';
import 'package:klinik/models/feed_consult.dart';

class FeedConsultCard extends StatelessWidget {
  const FeedConsultCard({
    super.key,
    required this.feedConsult,
    this.onTap,
  });

  final FeedConsult feedConsult;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage(
                        'assets/images/doctor_placeholder.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedConsult.doctorName,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Kategori: ${feedConsult.category}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                feedConsult.desc,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      feedConsult.consultDay,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      feedConsult.consultTime,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Jika ingin menambahkan tombol aksi, bisa ditempatkan di sini
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         // aksi jika diperlukan
              //       },
              //       child: const Text('Detail'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
