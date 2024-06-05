import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_project/add_task_screen.dart';
import 'package:note_project/task.dart';
import 'package:note_project/task_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

var taskBox = Hive.box<Task>('taskBox');

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: (context, index) {
              var task = taskBox.values.toList()[index];
              return TaskWidget(task: task);
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('images/icon_add.png'),
        backgroundColor: Color(0xff18DAA3),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }
}
