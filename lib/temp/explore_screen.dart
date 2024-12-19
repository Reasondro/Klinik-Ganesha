import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ElevatedButton(
      //   // Again, push on top of Explore -> Profile.
      //   onPressed: () => context.push('/profile'),
      //   child: const Text('Go to Profile'),
      // ),
      child: Text("Explore"),
    );
  }
}

               // Feed newFeed = Feed(
                //     userId: "c267e2d3-f6e4-4277-b5d8-f4ff9fdaed01",
                //     category: "consult",
                //     doctorId: Uuid().v4(),
                //     doctorName: "dr Satria",
                //     desc: "Ini orang sakit jantung");
                // _feedsDatabase.createFeedConsult(newFeed);

                // print(DateTime.now());
                // print(DateTime.now().toString().runtimeType);

                // print("2024-12-17");
                // final data = await Supabase.instance.client
                //     .from("doctors")
                //     .select("test_time");
                // print(data[0]["test_time"]);
                // print(data[0]["test_time"].runtimeType);

                // DateTime baseDateTime =
                //     DateTime.parse("1970-01-01 ${data[0]["test_time"]}");
                // print(baseDateTime);
                // print(DateTime.now());
                // int hoursOffset = int.parse(offset);
                // Duration timezoneOffset = Duration(hours: hoursOffset);
                // print(timezoneOffset);

                // baseDateTime.add(timezoneOffset);
                // print(baseDateTime);
                // final labId = data[0]["lab_id"];

                // print(labId.runtimeType);

                // final date = data[0]["created_at"];
                // final labId = data[0]["lab_id"];
                // print("Raw --> ${date}");
                // print("type of Raw Date: ${date.runtimeType}");

                // final formattedDate = DateTime.parse(date);
                // print("Formmated Date --> ${formattedDate}");
                // print("type of Formmated Date: ${formattedDate.runtimeType}");

                // final localFormattedDate = formattedDate.toLocal();
                // print("Local Formmated Date --> ${localFormattedDate}");
                // print(
                //     "type of Local Formmated Date: ${localFormattedDate.runtimeType}");

                // print(date == "a" ? "True" : "Obviously False");



//                 import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';
// import 'package:klinik/database/feeds_consult_database.dart';
// import 'package:klinik/models/feed_consult.dart';
// import 'package:klinik/router/routes.dart';
// import 'package:klinik/widgets/consult_event.dart';

// class ConsultScreen extends StatefulWidget {
//   const ConsultScreen({super.key});

//   @override
//   State<ConsultScreen> createState() => _ConsultScreenState();
// }

// class _ConsultScreenState extends State<ConsultScreen> {
//   final feedsConsultDatabase = FeedsConsultDatabase();
//   void cancelAppointment(FeedConsult feedConsult) {
//     feedsConsultDatabase.deleteFeedConsult(feedConsult);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16, right: 16.0, left: 16.0),
//       child: StreamBuilder(
//         stream: feedsConsultDatabase.stream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final List<FeedConsult> feedsConsult = snapshot.data!;
//           if (feedsConsult.isEmpty) {
//             return Center(
//               child: Row(
//                 spacing: 10,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       context.push(Routes.nestedDoctorsScreen);
//                     },
//                     icon: const Icon(Icons.add),
//                     label: const Text('Konsultasi Offline'),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // context.push(Routes.nestedDoctorsScreen);
//                     },
//                     icon: const Icon(Icons.add),
//                     label: const Text('Konsultasi Online'),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return Column(
//             spacing: 10,
//             children: [
//               Row(
//                 spacing: 10,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       context.push(Routes.nestedDoctorsScreen);
//                     },
//                     icon: const Icon(Icons.add),
//                     label: const Text('Konsultasi Offline'),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // context.push(Routes.nestedDoctorsScreen);
//                     },
//                     icon: const Icon(Icons.add),
//                     label: const Text('Konsultasi Online'),
//                   ),
//                 ],
//               ),
//               Text(
//                 "Janji konsultasi mendatang Anda",
//                 style: Theme.of(context).textTheme.titleMedium,
//                 textAlign: TextAlign.center,
//               ),
//               Flexible(
//                 child: ListView.builder(
//                   itemCount: feedsConsult.length,
//                   itemBuilder: (context, index) {
//                     final feedConsult = feedsConsult[index];
//                     return ConsultEvent(
//                       feedConsult: feedConsult,
//                       onCancel: () {
//                         cancelAppointment(feedConsult);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),

//       // ListView(
//       //   children: [
//       //     Text(
//       //       "Janji Konsultasi Anda",
//       //       style: Theme.of(context).textTheme.titleMedium,
//       //       textAlign: TextAlign.start,
//       //     ),
//       //     const SizedBox(height: 16),
//       //     Card(
//       //       shape: RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.circular(12),
//       //       ),
//       //       child: ListTile(
//       //         leading: const Icon(Icons.calendar_today),
//       //         title: const Text('Konsultasi Dengan Dr. Spesialis Jantung'),
//       //         subtitle: const Text('Senin, 20 Des 2024 - 10:00 AM'),
//       //         trailing: ElevatedButton(
//       //           onPressed: () {},
//       //           child: const Text('Detail'),
//       //         ),
//       //       ),
//       //     ),
//       //     const SizedBox(height: 8),
//       //     Card(
//       //       shape: RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.circular(12),
//       //       ),
//       //       child: ListTile(
//       //         leading: const Icon(Icons.calendar_today),
//       //         title: const Text('Konsultasi Dengan Dr. Spesialis Paru'),
//       //         subtitle: const Text('Rabu, 22 Des 2024 - 09:00 AM'),
//       //         trailing: ElevatedButton(
//       //           onPressed: () {},
//       //           child: const Text('Detail'),
//       //         ),
//       //       ),
//       //     ),
//       //     const SizedBox(height: 16),
//       //     Row(
//       //       spacing: 10,
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         ElevatedButton.icon(
//       //           onPressed: () {
//       //             context.push(Routes.nestedDoctorsScreen);
//       //           },
//       //           icon: const Icon(Icons.add),
//       //           label: const Text('Konsultasi Offline'),
//       //         ),
//       //         ElevatedButton.icon(
//       //           onPressed: () {
//       //             // context.push(Routes.nestedDoctorsScreen);
//       //           },
//       //           icon: const Icon(Icons.add),
//       //           label: const Text('Konsultasi Online'),
//       //         ),
//       //       ],
//       //     ),
//       //     const SizedBox(height: 16),
//       //     Text(
//       //       "Riwayat Konsultasi",
//       //       style: Theme.of(context).textTheme.titleMedium,
//       //       textAlign: TextAlign.start,
//       //     ),
//       //     const SizedBox(height: 16),
//       //     Card(
//       //       shape: RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.circular(12),
//       //       ),
//       //       child: ListTile(
//       //         leading: const Icon(Icons.history),
//       //         title: const Text('Konsultasi Dengan Dr. Spesialis Saraf'),
//       //         subtitle: const Text('Selesai: 10 Des 2024 - 14:00 PM'),
//       //         // trailing: ElevatedButton(
//       //         //   onPressed: () {},
//       //         //   child: const Text('Laporan'),
//       //         // ),
//       //       ),
//       //     ),
//       //     const SizedBox(height: 8),
//       //     Card(
//       //       shape: RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.circular(12),
//       //       ),
//       //       child: ListTile(
//       //         leading: const Icon(Icons.history),
//       //         title: const Text('Konsultasi Dengan Dr. Spesialis Kulit'),
//       //         subtitle: const Text('Selesai: 5 Des 2024 - 11:00 AM'),
//       //         // trailing: ElevatedButton(
//       //         //   onPressed: () {},
//       //         //   child: const Text('Laporan'),
//       //         // ),
//       //       ),
//       //     ),
//       //     const SizedBox(height: 16),
//       //   ],
//       // ),
//     );
//   }
// }





// home
    // if (feedsConsult.isEmpty) {
          //   return Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         'assets/images/no_appointment2.png',
          //         width: 400,
          //         fit: BoxFit.contain,
          //       ),
          //       Text(
          //         "Kosong nih, jadwal Anda.\nYuk, buat janji sekarang!",
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleMedium
          //             ?.copyWith(fontWeight: FontWeight.bold),
          //         textAlign: TextAlign.center,
          //       ),
          //     ],
          //   );
          // }

// SingleChildScrollView(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Janji minggu ini",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                   // Expanded(lt.length,
//                   //     itemBuilder: (conte
//                   //   child: ListView.builder(
//                   //     itemCount: feedsConsuxt, index) {
//                   //       final feedConsult = feedsConsult[index];
//                   //       return FeedConsultItem(
//                   //         feedConsult: feedConsult,
//                   //         onCancel: () {
//                   //           cancelAppointment(feedConsult);
//                   //         },
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
//                   for (FeedConsult fc in feedsConsult)
//                     FeedConsultItem(
//                         feedConsult: fc,
//                         onCancel: () {
//                           cancelAppointment(fc);
//                         })
//                 ]),
//           );
