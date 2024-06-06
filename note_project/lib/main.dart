import 'package:flutter/material.dart';
// import 'package:note_project/add_task_screen.dart';
// import 'package:note_project/home_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_project/home_main.dart';
import 'package:note_project/task.dart';

void main() async {
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');

  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: HomeScreenPage(),
    );
  }
}
