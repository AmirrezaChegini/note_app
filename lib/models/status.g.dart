// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Status.BANKING;
      case 1:
        return Status.FRIENDS;
      case 2:
        return Status.MEDITATING;
      case 3:
        return Status.MEETING;
      case 4:
        return Status.WORKING;
      case 5:
        return Status.WORKOUT;
      default:
        return Status.BANKING;
    }
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    switch (obj) {
      case Status.BANKING:
        writer.writeByte(0);
        break;
      case Status.FRIENDS:
        writer.writeByte(1);
        break;
      case Status.MEDITATING:
        writer.writeByte(2);
        break;
      case Status.MEETING:
        writer.writeByte(3);
        break;
      case Status.WORKING:
        writer.writeByte(4);
        break;
      case Status.WORKOUT:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
