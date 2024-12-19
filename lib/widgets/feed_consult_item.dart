import 'package:flutter/material.dart';
import 'package:klinik/models/feed_consult.dart';

class FeedConsultItem extends StatelessWidget {
  const FeedConsultItem(
      {super.key, required this.feedConsult, this.onTap, this.onCancel});

  final FeedConsult feedConsult;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 6,
                offset: const Offset(0, 1)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(feedConsult.imageUrl),
                ),
                const SizedBox(width: 12),
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1,
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.notes,
                    size: 20, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    feedConsult.desc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_month,
                    size: 20, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  feedConsult.consultDay,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 12),
                Icon(Icons.access_time,
                    size: 20, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  feedConsult.consultTime,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  child: Text(
                    'Batalkan',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onError),
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
