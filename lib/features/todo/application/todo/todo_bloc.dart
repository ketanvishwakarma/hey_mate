import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/domain/enums/todo_status/todo_status.dart';
import 'package:todo/features/todo/domain/model/ticker.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required Todo todo, required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        _ticker = const Ticker(),
        super(TodoState(todo: todo)) {
    on<TodoStarted>(_onTodoStarted);
    on<TodoUpdated>(_onTodoUpdated);
    on<TodoPaused>(_onTodoPaused);
    if (todo.isTimerRunning) {
      add(const TodoStarted());
    }
  }

  final TodoRepository _todoRepository;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void startTickerSubscription() {
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick().listen((_) => add(const TodoUpdated()));
  }

  FutureOr<void> _onTodoStarted(TodoStarted event, Emitter<TodoState> emit) {
    startTickerSubscription();
    final todo = state.todo.copyWith(
      status: TodoStatus.inProgress,
      isTimerRunning: true,
    );
    emit(TodoState(todo: todo));
  }

  FutureOr<void> _onTodoUpdated(
    TodoUpdated event,
    Emitter<TodoState> emit,
  ) {
    if (state.todo.remainingDurationInSeconds - 1 != -1) {
      final todo = state.todo.copyWith(
        status: TodoStatus.inProgress,
        isTimerRunning: true,
        remainingDurationInSeconds: state.todo.remainingDurationInSeconds - 1,
      );
      emit(TodoState(todo: todo));
      _todoRepository.update(todo);
    } else {
      final todo = state.todo.copyWith(
        status: TodoStatus.done,
        isTimerRunning: false,
        remainingDurationInSeconds: 0,
      );
      emit(TodoState(todo: todo));
      _todoRepository.update(todo);
    }
  }

  FutureOr<void> _onTodoPaused(TodoPaused event, Emitter<TodoState> emit) {
    _tickerSubscription?.cancel();
    final todo = state.todo.copyWith(
      isTimerRunning: false,
    );
    emit(TodoState(todo: todo));
    _todoRepository.update(todo);
  }
}
