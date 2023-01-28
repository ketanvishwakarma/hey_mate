import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hey_mate/features/todo/domain/enums/todo_status/todo_status.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required String description,
    required int remainingDurationInSeconds,
    required TodoStatus status,
    @Default(false) bool isTimerRunning,
  }) = _Todo;

  factory Todo.fromTodoDto(TodoDto todoDto) {
    return Todo(
      id: todoDto.id,
      title: todoDto.title,
      description: todoDto.description,
      remainingDurationInSeconds: todoDto.remainingDurationInSeconds,
      status: todoDto.status.fromString,
      isTimerRunning: todoDto.isTimerRunning,
    );
  }
}

extension DurationExtension on int {
  String get toDurationString {
    final minutes = (this / 60).floor().toString().padLeft(2, '0');
    final seconds = (this % 60).toString().padLeft(2, '0');
    return '${minutes}M : ${seconds}S';
  }
}
