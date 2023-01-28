import 'package:flutter/material.dart';

import 'package:hey_mate/app/app.dart';
import 'package:hey_mate/config/dependency_injection/dependency_injection.dart';

void main() async {
  await configureDependencies();
  runApp(const App());
}
