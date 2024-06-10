import 'package:flutter/material.dart';
// import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_project/eddit_task.dart';
import 'package:note_project/task.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getMainContainer();
  }

  Widget getMainContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      activeColor: Color(0xff18DAA3),
                      value: isBoxChecked,
                      onChanged: (isChecked) {
                        setState(() {
                          isBoxChecked = isChecked!;
                        });
                      }),
                  Text(
                    widget.task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Text(
                widget.task.subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 15,
                ),
              ),
              Spacer(),
              getTimeandEditBadgs(),
            ],
          ),
        ),
        Image.asset('images/workout.png'),
      ],
    );
  }

  Row getTimeandEditBadgs() {
    return Row(
      children: [
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.task.time.hour}:${widget.task.time.minute}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Color(0xff18DAA3),
                      fontFamily: 'SM',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
