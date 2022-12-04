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

class TodoListTodoChanged extends TodoListEvent {
  const TodoListTodoChanged(this.todo);

  final Todo todo;
}

class TodoListTodoStartRequested extends TodoListEvent {
  const TodoListTodoStartRequested(this.todo);

  final Todo todo;
}

class TodoListTodoPauseRequested extends TodoListEvent {
  const TodoListTodoPauseRequested(this.todo);

  final Todo todo;
}
