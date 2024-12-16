import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:klinik/database/note_database.dart';
import 'package:klinik/models/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late final TextEditingController _noteController;

  final NoteDatabase _notesDatabase = NoteDatabase();
  @override
  void initState() {
    _noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addNewNote() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("New Note"),
                content: TextField(
                  controller: _noteController,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                        _noteController.clear();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        final Note newNote = Note(
                          content: _noteController.text,
                        );
                        _notesDatabase.createNote(newNote);
                        context.pop();
                        _noteController.clear();
                      },
                      child: const Text("Save"))
                ],
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, right: 16.0, left: 16.0),
        child: ListView(
          children: [
            Text(
              "Your Notes",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewNote();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
