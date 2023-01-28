part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class TodoListWatchRequested extends TodoListEvent {
  const TodoListWatchRequested();
}

class TodoListUpdated extends TodoListEvent {
  const TodoListUpdated(this.todoList);

  final List<Todo> todoList;

  @override
  List<Object> get props => [todoList];
}
