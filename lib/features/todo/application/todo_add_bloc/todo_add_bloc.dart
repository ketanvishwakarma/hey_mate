import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hey_mate/constants/app_constants.dart';
import 'package:hey_mate/features/todo/domain/entities/todo/todo.dart';
import 'package:hey_mate/features/todo/domain/enums/todo_status/todo_status.dart';
import 'package:hey_mate/features/todo/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

part 'todo_add_event.dart';
part 'todo_add_state.dart';

@injectable
class TodoAddBloc extends Bloc<TodoAddEvent, TodoAddState> {
  TodoAddBloc(
    this._todoRepository,
  ) : super(const TodoAddInitialState()) {
    on<TodoAddRequested>(_onTodoAddRequested);
    on<TodoAddSaveDuration>(_onTodoAddSaveDuration);
  }

  final TodoRepository _todoRepository;
  var _selectedDuration = maxTimeDuration;

  FutureOr<void> _onTodoAddRequested(
    TodoAddRequested event,
    Emitter<TodoAddState> emit,
  ) async {
    emit(const TodoAddInProgressState());
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: event.title,
      description: event.description,
      remainingDurationInSeconds: _selectedDuration.inSeconds,
      status: TodoStatus.todo,
    );
    try {
      await _todoRepository.add(todo);
      emit(const TodoAddSuccessState());
    } on Exception {
      emit(const TodoAddFailureState('Something went wrong'));
    }
  }

  FutureOr<void> _onTodoAddSaveDuration(
    TodoAddSaveDuration event,
    Emitter<TodoAddState> emit,
  ) {
    _selectedDuration = event.duration;
  }
}
