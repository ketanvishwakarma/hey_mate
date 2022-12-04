part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class TodoListViewChanged extends TodoListEvent {
  const TodoListViewChanged({required this.isGridView});

  final bool isGridView;
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