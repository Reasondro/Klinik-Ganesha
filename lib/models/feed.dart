import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Feed {
  Feed(
      {String? id,
      required this.userId,
      this.desc,
      this.doctorId,
      this.doctorName,
      this.labId,
      this.labType,
      required this.category,
      // DateTime createdAt,
      this.createdAt})
      : id = id ?? uuid.v4();
  // createdAt = createdAt ?? DateTime.now();

  final String id;
  final String userId;
  // final DateTime? createdAt;
  final String? createdAt;
  final String category;

  final String? doctorId;
  final String? doctorName;

  final String? labId;
  final String? labType;

  final String? desc;

  factory Feed.fromMap(Map<String, dynamic> map) {
    return Feed(
        id: map["id"],
        userId: map["user_id"],
        createdAt: map["created_at"],
        category: map["category"],
        doctorId: map["doctor_id"],
        doctorName: map["doctor_name"],
        labId: map["lab_id"],
        labType: map["lab_type"],
        desc: map["desc"]);
  }
  Map<String, dynamic> toMapConsult() {
    return {
      "id": id,
      "user_id": userId,
      "category": category,
      "doctor_id": doctorId,
      "doctor_name": doctorName,
      "desc": desc,
    };
  }

  Map<String, dynamic> toMapLab() {
    return {
      "id": id,
      "user_id": userId,
      "category": category,
      "lab_id": labId,
      "lab_type": labType,
      "desc": desc,
    };
  }
}
