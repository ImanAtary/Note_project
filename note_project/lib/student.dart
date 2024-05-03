import 'package:hive_flutter/hive_flutter.dart';
part 'student.g.dart';

@HiveType(typeId: 2)
class Student {
  Student(
      {required this.name,
      required this.family,
      required this.age,
      required this.grade});

  @HiveField(0)
  String name;

  @HiveField(1)
  String family;

  @HiveField(2)
  double grade;

  @HiveField(3)
  int age;
}
