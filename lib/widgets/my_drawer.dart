import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
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
                const Text("Dark Mode"),
                const Spacer(),
                CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = value;
                      // Handle the theme change here, e.g., update app theme
                    });
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
