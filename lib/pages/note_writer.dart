import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_text_notifier.dart';
import 'package:notes_app/provider/title_notifier.dart';

class NoteWriter extends ConsumerStatefulWidget {
  final String actionTitle;
  const NoteWriter({super.key, required this.actionTitle});

  @override
  ConsumerState<NoteWriter> createState() => _NoteWriterState();
}

class _NoteWriterState extends ConsumerState<NoteWriter> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    noteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleNotifier = ref.watch(titleNotifierProvider.notifier);
    final noteTextNotifier = ref.watch(noteTextNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.actionTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: TextField(
                controller: titleController,
                decoration: inputDecorationForNote("Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: TextField(
                controller: noteTextController,
                decoration: inputDecorationForNote("Note Text"),
                keyboardType: TextInputType.multiline,
                maxLines:
                    null, // This allows the TextField to grow with the content
                minLines: 5, // Minimum lines to display initially
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: const Color.fromARGB(255, 174, 12, 0),
                      minimumSize: const Size(double.infinity, 25),
                    ),
                    label: const Text("Close"),
                    icon: const Icon(Icons.close),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      titleNotifier.addTitle(titleController.text);
                      noteTextNotifier.addNote(noteTextController.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      minimumSize: const Size(double.infinity, 25),
                    ),
                    label: const Text("Save"),
                    icon: const Icon(Icons.save),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecorationForNote(String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.all(20),
      labelText: hintText,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
