import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_project/task.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode state1 = FocusNode();
  FocusNode state2 = FocusNode();

  TextEditingController? controlerTilte;
  TextEditingController? controlerSubTilte;

  var taskAdd = Hive.box<Task>('taskBox');

  @override
  void initState() {
    // TODO: implement initState
    controlerTilte = TextEditingController(text: widget.task.title);
    controlerSubTilte = TextEditingController(text: widget.task.subtitle);
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
              height: 70,
            ),
            _getTextField(state1, 'عنوان تسک', controlerTilte!),
            SizedBox(
              height: 100,
            ),
            _getTextField(state2, 'توضیحات تسک', controlerSubTilte!),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    backgroundColor: Color(0xff18DAA3)),
                onPressed: () {
                  String title = controlerTilte!.text;
                  String subTitle = controlerSubTilte!.text;
                  EditText(title, subTitle);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ویرایش تسک',
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

  EditText(String title, String subTitle) {
    widget.task.title = title;
    widget.task.subtitle = subTitle;
    widget.task.save();
  }
}
