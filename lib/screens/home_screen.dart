import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:klinik/auth/auth_service.dart';
import 'package:klinik/database/feeds_consult_database.dart';
// import 'package:klinik/models/feed.dart';
import 'package:klinik/models/feed_consult.dart';
import 'package:klinik/widgets/feed_consult_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String? username =
      AuthService.supabase.auth.currentUser?.email ?? "Username";

  final feedsConsultDatabase = FeedsConsultDatabase();

  void cancelAppointment(FeedConsult feedConsult) {
    feedsConsultDatabase.deleteFeedConsult(feedConsult);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 13, left: 13),
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_appointment2.png',
                  width: 400,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Kosong nih, jadwal Anda.\nYuk, buat janji sekarang!",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
          return ListView.builder(
            itemCount: feedsConsult.length,
            itemBuilder: (context, index) {
              final feedConsult = feedsConsult[index];
              return FeedConsultItem(
                feedConsult: feedConsult,
                onCancel: () {
                  cancelAppointment(feedConsult);
                },
              );
            },
          );
        },
      ),
    );
  }
}
