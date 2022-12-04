import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/features/todo/data/dtos/todo/todo_dto.dart';

abstract class TodoLocalSource {
  Future<void> add(TodoDto todoDto);
  Future<void> update(TodoDto todoDto);
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
    await todoDto.save();
  }
}
