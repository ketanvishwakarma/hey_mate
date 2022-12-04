part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
