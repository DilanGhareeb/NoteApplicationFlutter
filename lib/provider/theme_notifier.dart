import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

// Define constants for light and dark themes
final ThemeData lightTheme = FlexThemeData.light(scheme: FlexScheme.amber);
final ThemeData darkTheme = FlexThemeData.dark(scheme: FlexScheme.amber);

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

  ThemeData get currentTheme => state;
}
