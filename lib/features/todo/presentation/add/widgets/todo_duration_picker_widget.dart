import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constants/app_constants.dart';

class TodoDurationPickerWidget extends StatefulWidget {
  const TodoDurationPickerWidget({
    super.key,
    required this.onDurationSelected,
  });

  final void Function(Duration) onDurationSelected;

  @override
  State<TodoDurationPickerWidget> createState() =>
      _TodoDurationPickerWidgetState();
}

class _TodoDurationPickerWidgetState extends State<TodoDurationPickerWidget> {
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
