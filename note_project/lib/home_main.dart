import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
bool isFabVisibale = true;

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if (notification.direction == ScrollDirection.forward) {
                  isFabVisibale = true;
                }
                if (notification.direction == ScrollDirection.reverse) {
                  isFabVisibale = false;
                }
              });
              return true;
            },
            child: ListView.builder(
              itemCount: taskBox.values.length,
              itemBuilder: (context, index) {
                var task = taskBox.values.toList()[index];
                return TaskWidget(task: task);
              },
            ),
          );
        },
      )),
      floatingActionButton: Visibility(
        visible: isFabVisibale,
        child: FloatingActionButton(
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
      ),
    );
  }
}
