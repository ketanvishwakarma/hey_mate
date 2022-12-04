import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/features/todo/application/todo_add_bloc/todo_add_bloc.dart';
import 'package:todo/features/todo/presentation/add/widgets/todo_duration_picker_widget.dart';
import 'package:todo/utils/validations.dart';

class CreateTodoFormWidget extends StatelessWidget {
  CreateTodoFormWidget({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            validator: Validations.validate,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          const Gap(
            height: 20,
          ),
          Text(
            'Duration',
            style: textTheme.headline6,
          ),
          TodoDurationPickerWidget(
            onDurationSelected: (duration) {
              context
                  .read<TodoAddBloc>()
                  .add(TodoAddSaveDuration(duration: duration));
            },
          ),
          SizedBox(
            width: size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<TodoAddBloc>().add(
                        TodoAddRequested(
                          title: _titleController.text.trim(),
                          description: _descriptionController.text.trim(),
                        ),
                      );
                }
              },
              child: Text(
                'Create',
                style: textTheme.headline6?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
