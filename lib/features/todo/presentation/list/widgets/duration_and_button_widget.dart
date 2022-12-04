import 'package:flutter/material.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/presentation/list/widgets/duration_widget.dart';
import 'package:todo/features/todo/presentation/list/widgets/start_pause_button.dart';

class DurationAndButtonWidget extends StatelessWidget {
  const DurationAndButtonWidget({
    super.key,
    required this.todo,
    required this.isGridView,
  });

  final Todo todo;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    if (isGridView) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DurationWidget(todo: todo),
          const Gap(),
          StartPauseButton(
            todo: todo,
          ),
        ],
      );
    } else {
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
}
