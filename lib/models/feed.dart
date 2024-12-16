import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Feed {
  Feed({
    String? id,
    this.desc,
    this.doctorId,
    this.doctorName,
    this.labId,
    this.labType,
    required this.category,
    DateTime? creationTime,
  })  : id = id ?? uuid.v4(),
        creationTime = creationTime ?? DateTime.now();

  final String id;
  final DateTime? creationTime;
  final String category;

  final String? doctorId;
  final String? doctorName;

  final String? labId;
  final String? labType;

  final String? desc;
}
