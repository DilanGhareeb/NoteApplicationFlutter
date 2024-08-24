import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'note_text_notifier.g.dart';

@riverpod
class NoteTextNotifier extends _$NoteTextNotifier {
  final SharedPreferencesAsync _pref = SharedPreferencesAsync();

  @override
  List<String> build() {
    fetchNotes(); // Load the saved notes from SharedPreferencesAsync
    return [];
  }

  // Create: Add a note
  Future<void> addNote(String note) async {
    List<String> notes = state;
    notes.add(note);

    await _pref.setStringList("note_list", notes);

    state = [...notes];
  }

  // Read: Fetch all notes
  Future<void> fetchNotes() async {
    final List<String>? notes = await _pref.getStringList("note_list");
    if (notes != null) {
      state = [...notes];
    }
  }

  // Update: Modify a note at a specific index
  Future<void> updateNote(int index, String newNote) async {
    List<String> notes = state;

    if (index >= 0 && index < notes.length) {
      notes[index] = newNote;

      await _pref.setStringList("note_list", notes);

      state = [...notes];
    }
  }

  // Delete: Remove a note at a specific index
  Future<void> deleteNote(int index) async {
    List<String> notes = state;

    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);

      await _pref.setStringList("note_list", notes);

      state = [...notes];
    }
  }

  // Delete All: Clear all notes
  Future<void> clearAllNotes() async {
    await _pref.remove("note_list");

    state = [];
  }
}
