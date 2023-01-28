import 'package:flutter/material.dart';

import 'package:hey_mate/config/theme/app_theme.dart';
import 'package:hey_mate/features/todo/presentation/list/todo_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeyMate',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const TodoListScreen(),
    );
  }
}
