import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/application/todo/todo_bloc.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/domain/enums/todo_status/todo_status.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) =>
          previous.todo.isTimerRunning != current.todo.isTimerRunning,
      builder: (context, state) {
        final isTimerRunning = state.todo.isTimerRunning;
        return ElevatedButton(
          onPressed: state.todo.status.isDone
              ? null
              : () => _onPressed(context, isTimerRunning),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isTimerRunning ? 'Pause' : 'Start',
              ),
              Icon(
                isTimerRunning ? Icons.pause : Icons.play_arrow,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onPressed(BuildContext context, bool isTimerRunning) {
    if (isTimerRunning) {
      context.read<TodoBloc>().add(const TodoPaused());
    } else {
      context.read<TodoBloc>().add(const TodoStarted());
    }
  }
}
