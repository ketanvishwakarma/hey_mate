import 'package:flutter/material.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/presentation/list/widgets/duration_and_button_widget.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.isGrid,
  });

  final Todo todo;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(SizeConstants.bodyPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          todo.title,
                          style: textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const Gap(),
                      const Icon(
                        Icons.circle_outlined,
                      ),
                    ],
                  ),
                  Text(
                    todo.description,
                    style: textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: DurationAndButtonWidget(
                todo: todo,
                isGridView: isGrid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
