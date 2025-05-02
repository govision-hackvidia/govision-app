import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:govision/app/app.dart';
import 'package:govision/bootstrap.dart';
import 'package:govision/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await bootstrap(() => const App());
}
