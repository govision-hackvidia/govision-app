import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/data.dart';

class EnviroscanRepositoryImpl implements EnviroscanRepository {
  EnviroscanRepositoryImpl({required DioClient client}) : _client = client;

  final DioClient _client;

  @override
  Future<String> sendScan(String text, XFile image) async {
    final fileName = image.path.split('/').last;

    final formData = FormData.fromMap({
      'text': text,
      'img': await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        '/enviroscan',
        data: formData,
        options: Options(
          headers: {Headers.contentTypeHeader: 'multipart/form-data'},
        ),
      );

      return response.data?['text'] as String? ?? '';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
