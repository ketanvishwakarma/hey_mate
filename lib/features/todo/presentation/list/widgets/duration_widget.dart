import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_mate/features/todo/application/todo/todo_bloc.dart';
import 'package:hey_mate/features/todo/domain/entities/todo/todo.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) =>
          previous.todo.remainingDurationInSeconds !=
          current.todo.remainingDurationInSeconds,
      builder: (context, state) {
        return Text(
          state.todo.remainingDurationInSeconds.toDurationString,
          style: Theme.of(context).textTheme.titleMedium,
        );
      },
    );
  }
}
