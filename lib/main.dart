import 'package:flutter/material.dart';
import 'package:todo/app/app.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';

void main() async {
  await configureDependencies();
  runApp(const App());
}
