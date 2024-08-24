import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/pages/note_writer.dart';
import 'package:notes_app/provider/note_text_notifier.dart';
import 'package:notes_app/provider/title_notifier.dart';
import 'package:notes_app/widgets/my_drawer.dart';
import 'package:notes_app/widgets/my_note.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final titles = ref.watch(titleNotifierProvider);
    final notesText = ref.watch(noteTextNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Application"),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          final title = titles[index];
          final noteText = notesText[index];
          return MyNote(
            title: title,
            noteText: noteText,
            indexOfNote: index,
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
