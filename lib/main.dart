import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/app.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';

void main() async {
  await Hive.initFlutter();
  await configureDependencies();
  runApp(const App());
}
