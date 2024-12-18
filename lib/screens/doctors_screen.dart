import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:klinik/database/doctors_database.dart';
import 'package:klinik/models/feed_consult.dart';

import 'package:klinik/widgets/doctor_card.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final DoctorsDatabase _doctorsDatabase = DoctorsDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctors List")),
      body: Padding(
          padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
          child: StreamBuilder(
              stream: _doctorsDatabase.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final doctors = snapshot.data!;
                return ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return DoctorCard(
                        doctor: doctor,
                      );
                    });
              })),
    );
  }
}
