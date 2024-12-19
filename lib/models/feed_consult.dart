import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class FeedConsult {
  FeedConsult(
      {String? id,
      this.createdAt,
      required this.userId,
      required this.category,
      required this.doctorId,
      required this.doctorName,
      required this.desc,
      required this.consultTime,
      required this.consultDay,
      required this.imageUrl})
      : id = id ?? uuid.v4();

  final String id;
  final String? createdAt;

  final String userId;
  final String category;
  final String doctorId;
  final String doctorName;

  final String desc;

  final String consultTime;
  final String consultDay;

  final String imageUrl;

  factory FeedConsult.fromMap(Map<String, dynamic> map) {
    return FeedConsult(
      id: map["id"],
      createdAt: map["created_at"],
      userId: map["user_id"],
      category: map["category"],
      doctorId: map["doctor_id"],
      doctorName: map["doctor_name"],
      desc: map["desc"],
      consultTime: map["consult_time"],
      consultDay: map["consult_day"],
      imageUrl: map["image_url"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "category": category,
      "doctor_id": doctorId,
      "doctor_name": doctorName,
      "desc": desc,
      "consult_time": consultTime,
      "consult_day": consultDay,
      "image_url": imageUrl,
    };
  }
}
