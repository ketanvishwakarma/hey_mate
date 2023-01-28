part of 'todo_list_bloc.dart';

enum Status { initial, inProgress, success, failure }

class TodoListState extends Equatable {
  const TodoListState({
    this.status = Status.initial,
    this.todoList = const [],
    this.error = '',
  });

  final Status status;
  final List<Todo> todoList;
  final String error;

  @override
  List<Object> get props => [
        status,
        todoList,
        error,
      ];

  TodoListState copyWith({
    Status? status,
    List<Todo>? todoList,
    String? error,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
      error: error ?? this.error,
    );
  }
}
