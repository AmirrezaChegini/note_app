import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String subject;

  @HiveField(1)
  String text;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  TaskType taskType;

  Task({
    required this.subject,
    required this.text,
    required this.isDone,
    required this.taskType,
  });
}
