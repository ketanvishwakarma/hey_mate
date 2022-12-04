import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';
import 'package:todo/constants/app_constants.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/application/todo_add_bloc/todo_add_bloc.dart';
import 'package:todo/utils/validations.dart';

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
            child: BuildForm(),
          ),
        ),
      ),
    );
  }
}

class BuildForm extends StatelessWidget {
  BuildForm({
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
          DurationPicker(
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
                          title: _titleController.text,
                          description: _descriptionController.text,
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

class DurationPicker extends StatefulWidget {
  const DurationPicker({
    super.key,
    required this.onDurationSelected,
  });

  final void Function(Duration) onDurationSelected;

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTimerPicker(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      mode: CupertinoTimerPickerMode.ms,
      initialTimerDuration: maxTimeDuration,
      onTimerDurationChanged: (value) {
        if (value < minTimeDuration || value > maxTimeDuration) {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Duration should be between 1 second and 10 minutes',
              ),
            ),
          );
          return;
        } else {
          widget.onDurationSelected.call(value);
        }
      },
    );
  }
}
