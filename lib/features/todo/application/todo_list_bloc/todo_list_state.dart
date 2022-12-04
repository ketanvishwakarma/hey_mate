part of 'todo_list_bloc.dart';

enum Status { initial, inProgress, success, failure }

class TodoListState extends Equatable {
  const TodoListState({
    this.status = Status.initial,
    this.todoList = const [],
    this.error = '',
    this.isGridView = false,
  });

  final Status status;
  final List<Todo> todoList;
  final String error;
  final bool isGridView;

  @override
  List<Object> get props => [
        status,
        todoList,
        error,
        isGridView,
      ];

  TodoListState copyWith({
    Status? status,
    List<Todo>? todoList,
    String? error,
    bool? isGridView,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
      error: error ?? this.error,
      isGridView: isGridView ?? this.isGridView,
    );
  }
}
