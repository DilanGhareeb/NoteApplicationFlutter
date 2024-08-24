import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/pages/note_writer.dart';
import 'package:notes_app/provider/note_text_notifier.dart';
import 'package:notes_app/provider/title_notifier.dart';

class MyNote extends ConsumerWidget {
  final String title;
  final String noteText;
  final int indexOfNote;

  const MyNote({
    super.key,
    required this.title,
    required this.noteText,
    required this.indexOfNote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleProvider = ref.read(titleNotifierProvider.notifier);
    final noteTextProvider = ref.read(noteTextNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(noteText),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoteWriter(
                      actionTitle: "Edit Note",
                      title: title,
                      noteText: noteText,
                      indexOfNote: indexOfNote,
                    ),
                  ),
                );
              },
              tooltip: 'Edit Note',
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                titleProvider.deleteTitle(indexOfNote);
                noteTextProvider.deleteNote(indexOfNote);
              },
              tooltip: 'Delete Note',
            ),
          ],
        ),
      ),
    );
  }
}
