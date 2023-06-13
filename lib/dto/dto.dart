import 'package:hive/hive.dart';

part 'dto.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String? content;
  
  @HiveField(1)
  DateTime? until;
  
  @HiveField(2)
  bool done = false;

  Todo(this.content, this.until, this.done);

  @override
  String toString() {
    return '$content, $until, $done';
  }
}

@HiveType(typeId: 1)
class TodoCompleted {
  @HiveField(0)
  String? content;

  @HiveField(1)
  DateTime? until;

  @HiveField(2)
  DateTime? completed;

  @HiveField(3)
  bool done = true;


  TodoCompleted(this.content, this.until, this.completed, this.done);

  @override
  String toString() {
    return '$content, $until, $completed, $done';
  }
}