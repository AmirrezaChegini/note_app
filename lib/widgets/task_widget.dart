import 'package:flutter/material.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/pages/edit_task_page.dart';
import 'package:note_app/utils/constants.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  TaskWidget({required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        color: Constants.grey,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () => goToEditTaskPage(),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                _chBox(),
                _texts(),
                _image(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chBox() {
    return Expanded(
      flex: 15,
      child: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          value: widget.task.isDone,
          onChanged: (value) {
            setState(() {
              //save check of every task
              widget.task.isDone = value!;
              widget.task.save();
            });
          },
          activeColor: Constants.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _texts() {
    return Expanded(
      flex: 55,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.task.subject,
              maxLines: 1,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'PM',
              ),
            ),
            Text(
              widget.task.text,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PR',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Expanded(
      flex: 30,
      child: Image.asset(widget.task.taskType.image),
    );
  }

  void goToEditTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskPage(task: widget.task)),
    );
  }
}
