// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_add_bloc.dart';

abstract class TodoAddEvent extends Equatable {
  const TodoAddEvent();

  @override
  List<Object> get props => [];
}

class TodoAddRequested extends TodoAddEvent {
  const TodoAddRequested({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class TodoAddSaveDuration extends TodoAddEvent {
  const TodoAddSaveDuration({
    required this.duration,
  });

  final Duration duration;
}
