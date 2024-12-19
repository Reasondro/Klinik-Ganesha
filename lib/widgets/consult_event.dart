import 'package:flutter/material.dart';
import 'package:klinik/database/feeds_consult_database.dart';
import 'package:klinik/models/feed_consult.dart';

class ConsultEvent extends StatelessWidget {
  const ConsultEvent(
      {super.key, required this.feedConsult, this.onTap, this.onCancel});
  final FeedConsult feedConsult;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text('Konsultasi Dengan ${feedConsult.doctorName}'),
        subtitle:
            Text("${feedConsult.consultDay}, Pukul ${feedConsult.consultTime}"),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Detail'),
        ),
      ),
    );
  }
}
