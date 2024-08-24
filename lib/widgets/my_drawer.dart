import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/theme_notifier.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({super.key});

  @override
  ConsumerState createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding:
                EdgeInsets.zero, // Use EdgeInsets.zero for no extra padding
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.note,
                      size: 64.0, // Adjust the size if needed
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary, // Adjust color for better visibility
                    ),
                    Text(
                      "Note Application",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                const Icon(Icons.dark_mode),
                const SizedBox(width: 5),
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: themeNotifier.isDarkMode ?? false,
                  onChanged: (bool value) {
                    themeNotifier.toggleTheme();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
