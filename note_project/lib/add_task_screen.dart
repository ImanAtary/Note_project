import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_project/task.dart';
import 'package:note_project/task_type.dart';
import 'package:note_project/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode state1 = FocusNode();
  FocusNode state2 = FocusNode();

  TextEditingController controlerTilte = TextEditingController();
  TextEditingController controlerSubTilte = TextEditingController();

  var taskAdd = Hive.box<Task>('taskBox');

  DateTime? _time;

  int _selectedItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state1.addListener(() {
      setState(() {});
    });
    state2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            _getTextField(state1, 'عنوان تسک', controlerTilte),
            SizedBox(
              height: 100,
            ),
            _getTextField(state2, 'توضیحات تسک', controlerSubTilte),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomHourPicker(
                title: 'زمان تسک را انتخاب کن',
                titleStyle: TextStyle(
                  color: Color(0xff18DAA3),
                ),
                negativeButtonText: 'حذف کن',
                negativeButtonStyle: TextStyle(
                  color: Color.fromARGB(255, 173, 26, 26),
                ),
                positiveButtonText: 'انتخاب زمان',
                positiveButtonStyle: TextStyle(
                  color: Color(0xff18DAA3),
                ),
                elevation: 2,
                onNegativePressed: (context) {},
                onPositivePressed: (context, time) {
                  _time = time;
                },
              ),
            ),
            Container(
              height: 186,
              child: ListView.builder(
                itemCount: getTaskTypeList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedItem = index;
                      });
                    },
                    child: TaskItem(
                      index: index,
                      selectedItem: _selectedItem,
                      taskType: getTaskTypeList()[index],
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    backgroundColor: Color(0xff18DAA3)),
                onPressed: () {
                  String title = controlerTilte.text;
                  String subTitle = controlerSubTilte.text;
                  addText(
                    title,
                    subTitle,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'اضافه شدن تسک',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Directionality _getTextField(
      FocusNode focus, String title, TextEditingController textController) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: TextField(
          controller: textController,
          focusNode: focus,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: title,
            labelStyle: TextStyle(
              fontFamily: 'GM',
              fontSize: 16,
              color: focus.hasFocus ? Color(0xff18DAA3) : Color(0xffC5C5C5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                width: 3,
                color: const Color(0xffC5C5C5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                width: 3,
                color: Color(0xff18DAA3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  addText(String title, String subTitle) {
    var task = Task(title: title, subtitle: subTitle, time: _time!);
    taskAdd.add(task);
  }
}

class TaskItem extends StatelessWidget {
  TaskItem(
      {super.key,
      required this.taskType,
      required this.index,
      required this.selectedItem});
  TaskType taskType;
  int index;
  int selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: (selectedItem == index) ? Color(0xff18DAA3) : Colors.grey,
            width: (selectedItem == index) ? 3 : 2,
          ),
          borderRadius: BorderRadius.circular(8)),
      width: 140,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(taskType.title),
        ],
      ),
    );
  }
}
