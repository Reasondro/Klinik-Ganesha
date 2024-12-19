import 'package:klinik/auth/auth_service.dart';
import 'package:klinik/models/feed_consult.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedsConsultDatabase {
  final database = Supabase.instance.client.from("feeds_consult");

  Future createFeedConsult(FeedConsult newFeedConsult) async {
    await database.insert(newFeedConsult.toMap());
  }

  final stream = Supabase.instance.client
      .from("feeds_consult")
      .stream(primaryKey: ["id"]).map((data) => data
          .map((feedConsultMap) => FeedConsult.fromMap(feedConsultMap))
          .toList());

// TODO ⬇️ ask supabase officials why this does not work
  //       final stream = Supabase.instance.client
  // .from("feeds_consult")
  // .stream(primaryKey: ["id"])
  // .eq('user_id', AuthService().getCurrentUserId()!)
  // .map((data) => data
  //     .map((feedConsultMap) => FeedConsult.fromMap(feedConsultMap))
  //     .toList());

  // Future updateNote(FeedConsult oldNote, String newContent) async {
  //   await database.update({"content": newContent}).eq("id", oldNote.id!);
  // }

  Future deleteFeedConsult(FeedConsult feedConsult) async {
    await database.delete().eq("id", feedConsult.id);
  }

  Future deleteFeedConsultById(String feedConsultId) async {
    await database.delete().eq("id", feedConsultId);
  }
}
