import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/data.dart';
import 'package:govision/utils/utils.dart';

class HazalertRepositoryImpl implements HazalertRepository {
  HazalertRepositoryImpl({required DioClient client}) : _client = client;

  final DioClient _client;

  @override
  Future<double> hazalert(XFile image) async {
    final compressedImage = await ImageUtils.smartCompress(image);
    final fileName = compressedImage.path.split('/').last;

    final formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        '/hazalert',
        data: formData,
        options: Options(
          headers: {Headers.contentTypeHeader: 'multipart/form-data'},
        ),
      );

      return response.data?['nearest_distance'] as double? ?? 0.0;
    } catch (e) {
      return 0.0;
    }
  }
}
