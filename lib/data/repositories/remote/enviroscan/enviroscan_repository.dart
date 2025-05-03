import 'package:camera/camera.dart';

mixin EnviroscanRepository {
  Future<String> sendScan(String text, XFile image);
}
