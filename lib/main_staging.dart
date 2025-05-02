import 'package:flutter/material.dart';
import 'package:govision/app/app.dart';
import 'package:govision/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
