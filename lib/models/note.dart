class Note {
  Note({this.id, DateTime? createdAt, required this.content})
      : createdAt = createdAt ?? DateTime.now();

  int? id;
  DateTime? createdAt;
  String content;

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"] as int,
      content: map["content"],
      // createdAt: map["created_at"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "content": content,
      //  "created_at": createdAt
    };
  }
}
