import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/application/todo_add_bloc/todo_add_bloc.dart';
import 'package:todo/features/todo/presentation/add/widgets/create_todo_form_widget.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TodoAddBloc>(),
      child: BlocListener<TodoAddBloc, TodoAddState>(
        listener: (context, state) {
          if (state is TodoAddSuccessState) {
            Navigator.of(context).pop();
          } else if (state is TodoAddFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Todo'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeConstants.bodyPadding),
            child: CreateTodoFormWidget(),
          ),
        ),
      ),
    );
  }
}
