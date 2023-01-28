import 'package:flutter/material.dart';
import 'package:hey_mate/features/todo/domain/entities/todo/todo.dart';
import 'package:hey_mate/features/todo/presentation/list/widgets/duration_widget.dart';
import 'package:hey_mate/features/todo/presentation/list/widgets/start_pause_button.dart';

class DurationAndButtonWidget extends StatelessWidget {
  const DurationAndButtonWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DurationWidget(todo: todo),
        const SizedBox(
          height: 20,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),
        StartPauseButton(
          todo: todo,
        ),
      ],
    );
  }
}
