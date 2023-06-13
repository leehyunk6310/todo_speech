// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      fields[0] as String?,
      fields[1] as DateTime?,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.until)
      ..writeByte(2)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoCompletedAdapter extends TypeAdapter<TodoCompleted> {
  @override
  final int typeId = 1;

  @override
  TodoCompleted read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoCompleted(
      fields[0] as String?,
      fields[1] as DateTime?,
      fields[2] as DateTime?,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoCompleted obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.until)
      ..writeByte(2)
      ..write(obj.completed)
      ..writeByte(3)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoCompletedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
