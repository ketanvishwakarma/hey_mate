import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:todo/features/todo/domain/todo_status/todo_status.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required String description,
    required String remainingDuration,
    required TodoStatus status,
  }) = _Todo;

  factory Todo.fromTodoDto(TodoDto todoDto) {
    return Todo(
      id: todoDto.id,
      title: todoDto.title,
      description: todoDto.description,
      remainingDuration: todoDto.remainingDurationInSeconds.toDurationString,
      status: todoDto.status.fromString(todoDto.status),
    );
  }
}
