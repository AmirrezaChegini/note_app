import 'package:flutter/material.dart';
import 'package:note_app/models/status.dart';
import 'package:note_app/models/task_type.dart';

class Constants {
  // Colors
  static final Color green = Color(0xff18daa3);
  static final Color white = Colors.white;
  static final Color black = Colors.black;
  static final Color grey = Colors.grey.shade200;
  static final Color transparent = Colors.transparent;

  //Task Type list
  static List<TaskType> taskTypeList() {
    TaskType bankingType = TaskType(
      type: Status.BANKING,
      typeName: 'Banking',
      image: 'assets/images/banking.png',
    );
    TaskType friendsType = TaskType(
      type: Status.FRIENDS,
      typeName: 'Friends',
      image: 'assets/images/friends.png',
    );
    TaskType meditateType = TaskType(
      type: Status.MEDITATING,
      typeName: 'Meditating',
      image: 'assets/images/meditate.png',
    );
    TaskType meetingType = TaskType(
      type: Status.MEETING,
      typeName: 'Meeting',
      image: 'assets/images/meeting.png',
    );
    TaskType workingType = TaskType(
      type: Status.WORKING,
      typeName: 'Working',
      image: 'assets/images/working.png',
    );
    TaskType workoutType = TaskType(
      type: Status.WORKOUT,
      typeName: 'Workout',
      image: 'assets/images/workout.png',
    );

    return [
      bankingType,
      friendsType,
      meditateType,
      meetingType,
      workingType,
      workoutType,
    ];
  }
}
