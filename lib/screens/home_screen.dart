import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinik/auth/auth_service.dart';
import 'package:klinik/database/feeds_consult_database.dart';
import 'package:klinik/models/feed_consult.dart';
import 'package:klinik/router/routes.dart';
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
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: StreamBuilder<List<FeedConsult>>(
          stream: feedsConsultDatabase.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<FeedConsult> feedsConsult = snapshot.data!;

            Widget headerSection = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hai, ${username ?? 'Pengguna'}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Selamat datang di Klinik Ganesha. Lihat janji konsultasi Anda, atau buat janji baru sekarang.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            );

            if (feedsConsult.isEmpty) {
              return ListView(
                children: [
                  headerSection,
                  const SizedBox(height: 32),
                  // Ilustrasi kosong
                  Center(
                    child: Image.asset(
                      'assets/images/no_appointment2.png',
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Belum ada janji konsultasi yang terjadwal",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Mari buat janji baru untuk mendapatkan konsultasi dari dokter ahli sesuai kebutuhan Anda.",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.go(Routes.consultScreen);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Buat Janji Konsultasi Baru'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }

            final nextAppointment = feedsConsult.first;
            //  feedsConsult.sort((a,b) => a.consultTime.compareTo(b.consultTime));

            Widget summarySection = Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Janji Konsultasi Anda",
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.inversePrimary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Anda memiliki ${feedsConsult.length} janji konsultasi terjadwal.",
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onInverseSurface),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Janji terdekat: ${nextAppointment.consultDay} ${nextAppointment.consultTime}",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onInverseSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Ilustrasi kecil atau ikon
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.medical_services,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            );

            return ListView(
              children: [
                headerSection,
                const SizedBox(height: 24),
                summarySection,
                const SizedBox(height: 24),
                Text(
                  "Janji Mendatang",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Daftar janji konsultasi
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: feedsConsult.length,
                  itemBuilder: (context, index) {
                    final feedConsult = feedsConsult[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: FeedConsultItem(
                        feedConsult: feedConsult,
                        onCancel: () {
                          cancelAppointment(feedConsult);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.go(Routes.consultScreen);
                    },
                    icon: const Icon(Icons.search),
                    label: const Text("Jelajahi Layanan Lain"),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
