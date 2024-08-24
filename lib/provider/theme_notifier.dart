import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late bool isDarkMode;

  @override
  ThemeData build() {
    // Default initialization, fetchThemeMode will update this
    fetchThemeMode();
    return isDarkMode ? darkTheme : lightTheme;
  }

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode; // Toggle the isDarkMode flag
    await SharedPreferencesAsync().setBool("isDarkMode", isDarkMode);
    state = isDarkMode
        ? darkTheme
        : lightTheme; // Update the state with the new theme
  }

  Future<void> fetchThemeMode() async {
    isDarkMode = await SharedPreferencesAsync().getBool("isDarkMode") ??
        false; // Provide a default value if not found
    state = isDarkMode
        ? darkTheme
        : lightTheme; // Update the state to reflect the fetched value
  }
}
