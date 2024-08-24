import 'package:flutter/material.dart';
import 'package:notes_app/pages/note_writer.dart';
import 'package:notes_app/widgets/my_drawer.dart';
import 'package:notes_app/widgets/my_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> title = [];
  List<String> noteText = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Application"),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return const MyNote(
            title: "title",
            noteText: "fdddd",
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const NoteWriter(actionTitle: "Add a New Note")));
        },
        child: const Icon(
          Icons.add_rounded,
          size: 35,
        ),
      ),
    );
  }
}
