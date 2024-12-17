import 'package:klinik/models/feed.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedsDatabase {
  final database = Supabase.instance.client.from("feeds");

  Future createFeedConsult(Feed newFeed) async {
    await database.insert(newFeed.toMapConsult());
  }

  Future createFeedLab(Feed newFeed) async {
    await database.insert(newFeed.toMapLab());
  }

  final stream = Supabase.instance.client.from("feeds").stream(primaryKey: [
    "id"
  ]).map((data) => data.map((feedMap) => Feed.fromMap(feedMap)).toList());

  // TODO implement update
  // Future updateFeed(Feed oldFeed)

  Future deleteFeed(Feed feed) async {
    await database.delete().eq("id", feed.id);
  }
}
