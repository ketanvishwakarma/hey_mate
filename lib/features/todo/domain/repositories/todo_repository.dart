import 'package:todo/features/todo/domain/entities/todo/todo.dart';

abstract class TodoRepository {
  Future<void> add(Todo todo);
  Future<void> update(Todo todo);
  List<Todo> loadAllTodo();
  Stream<List<Todo>> watchAllTodo();
}
