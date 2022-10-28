import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/pages/add_task_page.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flotVisible = true;
  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: _appbar(),
      floatingActionButton: _floatBtn(),
      body: _body(),
    );
  }

  Widget _floatBtn() {
    return Visibility(
      visible: flotVisible,
      child: FloatingActionButton(
        onPressed: () => goToAddTaskPage(),
        backgroundColor: Constants.green,
        child: Image.asset('assets/icons/icon_add.png'),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      backgroundColor: Constants.green,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Notes',
        style: TextStyle(
          color: Constants.white,
          fontSize: 24,
          fontFamily: 'PR',
        ),
      ),
    );
  }

  Widget _body() {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        //show floating btn with scroll down
        setState(() {
          if (notification.direction == ScrollDirection.reverse) {
            flotVisible = false;
          } else if (notification.direction == ScrollDirection.forward) {
            flotVisible = true;
          }
        });
        return true;
      },
      child: ValueListenableBuilder(
        //update list with listen to database changes
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          List<Task> tasks = value.values.toList();
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) async {
                //delete task with drag task
                await tasks[index].delete();
              },
              child: TaskWidget(task: tasks[index]),
            ),
          );
        },
      ),
    );
  }

  void goToAddTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage()),
    );
  }
}
