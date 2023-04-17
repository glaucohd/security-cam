import 'package:flutter/material.dart';
import 'src/app/app.dart';
import 'src/app/core/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependences();
  runApp(const App());
}
