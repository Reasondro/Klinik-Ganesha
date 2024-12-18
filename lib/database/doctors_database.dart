import 'package:klinik/models/doctor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorsDatabase {
  final database = Supabase.instance.client.from("doctors");

  Future createDoctor(Doctor newDoctor) async {
    await database.insert(newDoctor.toMap());
  }

  final stream = Supabase.instance.client.from("doctors").stream(primaryKey: [
    "id"
  ]).map((data) => data.map((doctorMap) => Doctor.fromMap(doctorMap)).toList());

  // TODO implement update
//? update
  // Future updateDoctor(Doctor oldDoctor, String newContent) async {
  //   await database.update({"content": newContent}).eq("id", oldDoctor.id!);
  // }
  Future deleteFeed(Doctor doctor) async {
    await database.delete().eq("id", doctor.id);
  }
}
