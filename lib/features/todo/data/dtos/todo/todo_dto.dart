import 'package:hey_mate/features/todo/domain/entities/todo/todo.dart';
import 'package:hive/hive.dart';

part 'todo_dto.g.dart';

@HiveType(typeId: 0)
class TodoDto extends HiveObject {
  TodoDto({
    required this.id,
    required this.title,
    this.description = '',
    this.remainingDurationInSeconds = 600,
    this.status = 'Todo',
    this.isTimerRunning = false,
  });

  factory TodoDto.fromTodo(Todo todo) {
    return TodoDto(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      remainingDurationInSeconds: todo.remainingDurationInSeconds,
      status: todo.status.name,
      isTimerRunning: todo.isTimerRunning,
    );
  }

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int remainingDurationInSeconds;

  @HiveField(4)
  String status;

  @HiveField(5)
  bool isTimerRunning;
}
