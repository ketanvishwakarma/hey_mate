import 'package:flutter/material.dart';
import 'package:todo/config/theme/app_theme.dart';
import 'package:todo/features/todo/presentation/list/todo_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const TodoListScreen(),
    );
  }
}
