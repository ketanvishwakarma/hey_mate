import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/application/todo_list_bloc/todo_list_bloc.dart';
import 'package:todo/features/todo/presentation/list/widgets/todo_tile.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(SizeConstants.bodyPadding),
          sliver: SliverGrid(
            gridDelegate: state.isGridView
                ? const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 230,
                    crossAxisSpacing: SizeConstants.bodyPadding,
                    mainAxisSpacing: SizeConstants.bodyPadding,
                  )
                : const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2,
                    mainAxisSpacing: SizeConstants.bodyPadding,
                  ),
            delegate: SliverChildBuilderDelegate(
              childCount: state.todoList.length,
              (context, index) {
                return TodoTile(
                  todo: state.todoList.elementAt(index),
                  isGrid: state.isGridView,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
