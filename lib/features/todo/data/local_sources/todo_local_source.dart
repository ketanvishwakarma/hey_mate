import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class TodoLocalSource {
  Future<void> add(TodoDto todoDto);
  Future<void> update(TodoDto todoDto);
  List<TodoDto> loadAllTodoDto();
  Stream<List<TodoDto>> watchTodoDto();
}

@Injectable(as: TodoLocalSource)
class TodoLocalSourceImpl implements TodoLocalSource {
  const TodoLocalSourceImpl(this._todoBox);

  final Box<TodoDto> _todoBox;

  @override
  Future<void> add(TodoDto todoDto) async {
    await _todoBox.put(todoDto.id, todoDto);
  }

  @override
  Future<void> update(TodoDto todoDto) async {
    await _todoBox.put(todoDto.id, todoDto);
  }

  @override
  List<TodoDto> loadAllTodoDto() {
    return _todoBox.values.toList();
  }

  @override
  Stream<List<TodoDto>> watchTodoDto() {
    
    return _todoBox.watch().map((_) => _todoBox.values.toList());
  }
}
