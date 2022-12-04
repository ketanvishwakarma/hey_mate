import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/application/todo_list_bloc/todo_list_bloc.dart';

class TodoViewToggleButton extends StatelessWidget {
  const TodoViewToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(
      buildWhen: (previous, current) =>
          previous.isGridView != current.isGridView,
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.isGridView ? Icons.list : Icons.grid_view_outlined,
          ),
          onPressed: () {
            context.read<TodoListBloc>().add(
                  TodoListViewChanged(isGridView: !state.isGridView),
                );
          },
        );
      },
    );
  }
}
