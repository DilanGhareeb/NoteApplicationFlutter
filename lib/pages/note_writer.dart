import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_text_notifier.dart';
import 'package:notes_app/provider/title_notifier.dart';

class NoteWriter extends ConsumerStatefulWidget {
  final String actionTitle;
  final String? title;
  final String? noteText;
  final int? indexOfNote;

  const NoteWriter({
    super.key,
    required this.actionTitle,
    this.title,
    this.indexOfNote,
    this.noteText,
  });

  @override
  ConsumerState<NoteWriter> createState() => _NoteWriterState();
}

class _NoteWriterState extends ConsumerState<NoteWriter> {
  late TextEditingController titleController;
  late TextEditingController noteTextController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? "");
    noteTextController = TextEditingController(text: widget.noteText ?? "");
  }

  @override
  void dispose() {
    titleController.dispose();
    noteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleNotifier = ref.read(titleNotifierProvider.notifier);
    final noteTextNotifier = ref.read(noteTextNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.actionTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                maxLines: null, // Allows the TextField to grow with the content
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
                      if (titleController.text.isEmpty ||
                          noteTextController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Unsuccessful"),
                            content:
                                const Text("You cannot leave any field empty."),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Close"),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      if (widget.actionTitle == "Add a New Note") {
                        titleNotifier.addTitle(titleController.text);
                        noteTextNotifier.addNote(noteTextController.text);
                      } else if (widget.indexOfNote != null) {
                        titleNotifier.updateTitle(
                            widget.indexOfNote!, titleController.text);
                        noteTextNotifier.updateNote(
                            widget.indexOfNote!, noteTextController.text);
                      }

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
            ),
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
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
