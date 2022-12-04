part of 'todo_add_bloc.dart';

abstract class TodoAddState extends Equatable {
  const TodoAddState();

  @override
  List<Object> get props => [];
}

class TodoAddInitialState extends TodoAddState {
  const TodoAddInitialState();
}

class TodoAddInProgressState extends TodoAddState {
  const TodoAddInProgressState();

  @override
  List<Object> get props => [];
}

class TodoAddSuccessState extends TodoAddState {
  const TodoAddSuccessState();

  @override
  List<Object> get props => [];
}

class TodoAddFailureState extends TodoAddState {
  const TodoAddFailureState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
