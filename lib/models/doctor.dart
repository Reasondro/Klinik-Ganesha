import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Doctor {
  Doctor(
      {required this.id,
      required this.userId,
      required this.nameTitle,
      required this.specialize,
      required this.timeStart,
      required this.timeEnd,
      required this.dayStart,
      required this.dayEnd,
      required this.imageUrl});

  final String id;
  final String userId;
  final String nameTitle;
  final String specialize;

// TODO change timeStart & timeEnd jadi DateTime
  final String timeStart;
  final String timeEnd;

  final String dayStart;
  final String dayEnd;
  final String imageUrl;

  factory Doctor.fromMap(Map<String, dynamic> map) {
    // DateTime time_start = map["time_start"];
    // DateTime time_end = map["time_end"];
    return Doctor(
      id: map["id"],
      userId: map["user_id"],
      nameTitle: map["name_title"],
      specialize: map["specialize"],
      timeStart: map["time_start"],
      timeEnd: map["time_end"],
      dayStart: map["day_start"],
      dayEnd: map["day_end"],
      imageUrl: map["image_url"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "name_title": nameTitle,
      "specialize": specialize,
      "time_start": timeStart,
      "time_end": timeEnd,
      "day_start": dayStart,
      "day_end": dayEnd,
      "image_url": imageUrl,
    };
  }
}
