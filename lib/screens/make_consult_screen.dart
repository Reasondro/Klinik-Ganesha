import 'package:flutter/material.dart';
import 'package:klinik/database/feeds_database.dart';

class MakeConsultScreen extends StatefulWidget {
  const MakeConsultScreen({super.key});

  @override
  State<MakeConsultScreen> createState() => _MakeConsultScreenState();
}

class _MakeConsultScreenState extends State<MakeConsultScreen> {
  final FeedsDatabase _feedsDatabase = FeedsDatabase();

  @override
  Widget build(BuildContext context) {
    return Text("Something");
  }
}
