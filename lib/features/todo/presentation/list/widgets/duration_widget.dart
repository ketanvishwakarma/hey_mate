import 'package:flutter/material.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.remainingDurationInSeconds.toDurationString,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
