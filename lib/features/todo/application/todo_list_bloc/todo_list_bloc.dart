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
    on<TodoListTodoChanged>(_onTodoListTodoChanged);
    on<TodoListTodoStartRequested>(_onTodoListTodoStartRequested);
    on<TodoListTodoPauseRequested>(_onTodoListTodoPauseRequested);
  }

  final TodoRepository _todoRepository;

  FutureOr<void> _onTodoListWatchRequested(
    TodoListWatchRequested event,
    Emitter<TodoListState> emit,
  ) {
    _todoRepository.watchAllTodo().listen((todoList) {
      emit(
        state.copyWith(
          todoList: todoList,
          status: Status.success,
        ),
      );
    });
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
}
