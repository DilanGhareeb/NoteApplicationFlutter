import 'package:flutter/material.dart';
import 'package:notes_app/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Application"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text("Notes should be here"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_rounded,
          size: 35,
        ),
      ),
    );
  }
}
