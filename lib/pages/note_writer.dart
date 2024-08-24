import 'package:flutter/material.dart';

class NoteWriter extends StatefulWidget {
  final String actionTitle;
  const NoteWriter({super.key, required this.actionTitle});

  @override
  State<NoteWriter> createState() => _NoteWriterState();
}

class _NoteWriterState extends State<NoteWriter> {
  @override
  Widget build(BuildContext context) {
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
                decoration: inputDecorationForNote("Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: TextField(
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
                    onPressed: () {},
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
                    onPressed: () {},
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
