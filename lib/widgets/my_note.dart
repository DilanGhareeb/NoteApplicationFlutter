import 'package:flutter/material.dart';

class MyNote extends StatelessWidget {
  final String title;
  final String noteText;

  const MyNote({
    super.key,
    required this.title,
    required this.noteText,
  });

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
