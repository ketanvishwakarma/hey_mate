import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_mate/constants/size_constants.dart';
import 'package:hey_mate/features/todo/application/todo_list_bloc/todo_list_bloc.dart';
import 'package:hey_mate/features/todo/presentation/list/widgets/todo_tile.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.bodyPadding),
      child: BlocBuilder<TodoListBloc, TodoListState>(
        buildWhen: (previous, current) =>
            previous.todoList.length != current.todoList.length,
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('Todo list is empty'),
            );
          }
          return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                todo: state.todoList.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}
