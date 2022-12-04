import 'package:injectable/injectable.dart';
import 'package:todo/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:todo/features/todo/data/local_sources/todo_local_source.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImp implements TodoRepository {
  const TodoRepositoryImp(this._todoLocalSource);

  final TodoLocalSource _todoLocalSource;

  @override
  Future<void> add(Todo todo) async {
    final todoDto = TodoDto.fromTodo(todo);
    await _todoLocalSource.add(todoDto);
  }

  @override
  Future<void> update(Todo todo) {
    final todoDto = TodoDto.fromTodo(todo);
    return _todoLocalSource.update(todoDto);
  }

  @override
  Stream<List<Todo>> watchAllTodo() {
    return _todoLocalSource.watchTodoDto().map((todoDtoList) {
      return todoDtoList.map(Todo.fromTodoDto).toList();
    });
  }
}
