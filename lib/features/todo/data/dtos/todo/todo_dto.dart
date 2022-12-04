import 'package:hive/hive.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';

part 'todo_dto.g.dart';

@HiveType(typeId: 0)
class TodoDto extends HiveObject {
  TodoDto({
    required this.id,
    required this.title,
    this.description = '',
    this.remainingDurationInSeconds = 600,
    this.status = 'Todo',
  });

  factory TodoDto.fromTodo(Todo todo) {
    return TodoDto(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      remainingDurationInSeconds: todo.remainingDurationInSeconds,
      status: todo.status.toString(),
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
}
