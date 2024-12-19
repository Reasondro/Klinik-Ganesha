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

  void deleteNote(Note note) {
    _notesDatabase.deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: StreamBuilder(
          stream: _notesDatabase.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final notes = snapshot.data!;

            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note.content),
                    trailing: IconButton(
                        onPressed: () {
                          deleteNote(note);
                        },
                        icon: Icon(Icons.delete)),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewNote();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
