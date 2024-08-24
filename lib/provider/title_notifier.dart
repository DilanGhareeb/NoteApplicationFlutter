import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'title_notifier.g.dart';

@riverpod
class TitleNotifier extends _$TitleNotifier {
  final SharedPreferencesAsync _pref = SharedPreferencesAsync();

  @override
  List<String> build() {
    fetchTitles(); // Load the saved titles from SharedPreferencesAsync
    return [];
  }

  // Create: Add a title
  Future<void> addTitle(String title) async {
    List<String> titles = state;
    titles.add(title);

    await _pref.setStringList("title_list", titles);

    state = [...titles];
  }

  // Read: Fetch all titles
  Future<void> fetchTitles() async {
    final List<String>? titles = await _pref.getStringList("title_list");
    if (titles != null) {
      state = [...titles];
    }
  }

  // Update: Modify a title at a specific index
  Future<void> updateTitle(int index, String newTitle) async {
    List<String> titles = state;

    if (index >= 0 && index < titles.length) {
      titles[index] = newTitle;

      await _pref.setStringList("title_list", titles);

      state = [...titles];
    }
  }

  // Delete: Remove a title at a specific index
  Future<void> deleteTitle(int index) async {
    List<String> titles = state;

    if (index >= 0 && index < titles.length) {
      titles.removeAt(index);

      await _pref.setStringList("title_list", titles);

      state = [...titles];
    }
  }

  // Delete All: Clear all titles
  Future<void> clearAllTitles() async {
    await _pref.remove("title_list");

    state = [];
  }
}
