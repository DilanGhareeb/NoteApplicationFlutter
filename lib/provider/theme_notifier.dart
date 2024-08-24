import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeData build() {
    return lightTheme; // Set default theme
  }

  void toggleTheme() {
    // Toggle between light and dark themes
    state = state == lightTheme ? darkTheme : lightTheme;
  }

  bool get isLightTheme => state == lightTheme;
}
