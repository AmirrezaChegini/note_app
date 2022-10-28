import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/utils/constants.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  int taskTypeSelected = -1;
  var taskBox = Hive.box<Task>('taskBox');
  final TextEditingController edtSubCtrl = TextEditingController();
  final TextEditingController edtTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Constants.green,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        splashRadius: 25,
      ),
      actions: [
        IconButton(
          onPressed: () => saveTask(),
          icon: Icon(Icons.done),
          splashRadius: 25,
        )
      ],
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          _edtSub(),
          SizedBox(height: 10),
          _edtText(),
          SizedBox(height: 10),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: Constants.taskTypeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _taskTypeWidget(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskTypeWidget(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            taskTypeSelected = index;
          });
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color:
                  taskTypeSelected == index ? Constants.green : Constants.grey,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Image.asset(Constants.taskTypeList()[index].image),
              SizedBox(height: 10),
              Text(
                Constants.taskTypeList()[index].typeName,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'PR',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _edtText() {
    return TextField(
      controller: edtTextCtrl,
      cursorColor: Constants.green,
      maxLines: 15,
      decoration: InputDecoration(
        hintText: 'Text',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Constants.green,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _edtSub() {
    return TextField(
      controller: edtSubCtrl,
      cursorColor: Constants.green,
      decoration: InputDecoration(
        hintText: 'Subject',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Constants.green,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }

  void saveTask() async {
    //add task to database
    if ((edtSubCtrl.text.isNotEmpty || edtTextCtrl.text.isNotEmpty) &&
        (taskTypeSelected != -1)) {
      await taskBox.add(
        Task(
          subject: edtSubCtrl.text,
          text: edtTextCtrl.text,
          isDone: false,
          taskType: Constants.taskTypeList()[taskTypeSelected],
        ),
      );
      Navigator.pop(context);
    }
  }
}
