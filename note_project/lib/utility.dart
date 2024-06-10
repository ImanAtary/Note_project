import 'package:note_project/task_type.dart';
import 'package:note_project/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: taskTypeEnum.foucs),
    TaskType(
        image: 'images/work_meeting.png',
        title: 'قرار کاری',
        taskTypeEnum: taskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        taskTypeEnum: taskTypeEnum.working),
  ];

  return list;
}
