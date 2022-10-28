import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/status.dart';

part 'task_type.g.dart';

@HiveType(typeId: 1)
class TaskType {
  @HiveField(0)
  Status type;

  @HiveField(1)
  String typeName;

  @HiveField(2)
  String image;

  TaskType({
    required this.type,
    required this.typeName,
    required this.image,
  });
}
