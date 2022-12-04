import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc(this._todoRepository) : super(const TodoListState()) {
    on<TodoListWatchRequested>(_onTodoListWatchRequested);
    on<TodoListUpdated>(_onTodoListUpdated);
    on<TodoListTodoChanged>(_onTodoListTodoChanged);
    on<TodoListTodoStartRequested>(_onTodoListTodoStartRequested);
    on<TodoListTodoPauseRequested>(_onTodoListTodoPauseRequested);
  }

  final TodoRepository _todoRepository;
  StreamSubscription<List<Todo>>? _todoListSubscription;

  void _listenTodoList() {
    if (_todoListSubscription != null) {
      return;
    }
    _todoListSubscription = _todoRepository.watchAllTodo().listen((todoList) {
      add(TodoListUpdated(todoList));
    });
  }

  FutureOr<void> _onTodoListWatchRequested(
    TodoListWatchRequested event,
    Emitter<TodoListState> emit,
  ) async {
    final todoList = _todoRepository.loadAllTodo();
    emit(
      state.copyWith(
        status: Status.success,
        todoList: todoList,
      ),
    );
    _listenTodoList();
  }

  FutureOr<void> _onTodoListTodoChanged(
    TodoListTodoChanged event,
    Emitter<TodoListState> emit,
  ) {}

  FutureOr<void> _onTodoListTodoStartRequested(
    TodoListTodoStartRequested event,
    Emitter<TodoListState> emit,
  ) {}

  FutureOr<void> _onTodoListTodoPauseRequested(
    TodoListTodoPauseRequested event,
    Emitter<TodoListState> emit,
  ) {}

  @override
  Future<void> close() {
    _todoListSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onTodoListUpdated(
    TodoListUpdated event,
    Emitter<TodoListState> emit,
  ) {
    emit(
      state.copyWith(
        status: Status.success,
        todoList: event.todoList,
      ),
    );
  }
}
