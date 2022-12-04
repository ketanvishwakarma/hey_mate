part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoStarted extends TodoEvent {
  const TodoStarted();
}

class TodoPaused extends TodoEvent {
  const TodoPaused();
}

class TodoUpdated extends TodoEvent {
  const TodoUpdated();
}
