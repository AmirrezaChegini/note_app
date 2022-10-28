import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/status.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/models/task_type.dart';
import 'package:note_app/pages/home_page.dart';

void main() async {
  //init hive and adapters
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(StatusAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
