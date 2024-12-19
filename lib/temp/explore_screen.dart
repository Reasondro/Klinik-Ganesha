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