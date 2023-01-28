import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_mate/config/dependency_injection/dependency_injection.dart';
import 'package:hey_mate/features/todo/application/todo_list_bloc/todo_list_bloc.dart';
import 'package:hey_mate/features/todo/presentation/add/add_todo_screen.dart';
import 'package:hey_mate/features/todo/presentation/list/widgets/todo_list_widget.dart';
import 'package:hey_mate/features/todo/presentation/list/widgets/todo_view_toggle_button.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<TodoListBloc>()..add(const TodoListWatchRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: const [
            TodoViewToggleButton(),
          ],
        ),
        body: const CustomScrollView(
          slivers: [
            TodoListWidget(),
            SliverToBoxAdapter(
              child: SizedBox(height: 80),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const AddTodoScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
