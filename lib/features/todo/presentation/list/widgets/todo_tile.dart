import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/application/todo/todo_bloc.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/domain/enums/todo_status/todo_status.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';
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
    return BlocProvider(
      create: (context) => TodoBloc(
        todo: todo,
        todoRepository: getIt.get<TodoRepository>(),
      ),
      child: Card(
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
                        BlocBuilder<TodoBloc, TodoState>(
                          // buildWhen: (previous, current) =>
                          //     previous.todo.status != current.todo.status,
                          builder: (context, state) {
                            switch (state.todo.status) {
                              case TodoStatus.done:
                                return const FaIcon(
                                  FontAwesomeIcons.circleCheck,
                                  color: Colors.green,
                                );
                              case TodoStatus.inProgress:
                                return const FaIcon(
                                  FontAwesomeIcons.circleNotch,
                                  color: Colors.blue,
                                );
                              case TodoStatus.todo:
                                return const FaIcon(
                                  FontAwesomeIcons.circle,
                                  color: Colors.red,
                                );
                            }
                          },
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
      ),
    );
  }
}
