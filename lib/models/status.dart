import 'package:hive_flutter/hive_flutter.dart';

part 'status.g.dart';

@HiveType(typeId: 2)
enum Status {
  @HiveField(0)
  BANKING,

  @HiveField(1)
  FRIENDS,

  @HiveField(2)
  MEDITATING,

  @HiveField(3)
  MEETING,

  @HiveField(4)
  WORKING,

  @HiveField(5)
  WORKOUT,
}
