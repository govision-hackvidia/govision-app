import 'dart:io';

mixin EnviroscanRepository {
  Future<String> sendScan(String text, File image);
}
