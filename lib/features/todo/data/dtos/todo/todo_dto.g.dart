// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDtoAdapter extends TypeAdapter<TodoDto> {
  @override
  final int typeId = 0;

  @override
  TodoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoDto(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      remainingDurationInSeconds: fields[3] as int,
      status: fields[4] as String,
      isTimerRunning: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.remainingDurationInSeconds)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.isTimerRunning);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
