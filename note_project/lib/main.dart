import 'package:flutter/material.dart';
import 'package:note_project/car.dart';
import 'package:note_project/home_main.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'student.dart';

void main() async {
  await Hive.initFlutter();
  var name = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('studentBox');

  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenPage(),
    );
  }
}
