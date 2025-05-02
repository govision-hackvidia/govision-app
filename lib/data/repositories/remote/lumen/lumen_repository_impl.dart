import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/repositories/remote/lumen/lumen.dart';

class LumenRepositoryImpl implements LumenRepository {
  LumenRepositoryImpl({required DioClient client}) : _client = client;

  final DioClient _client;

  @override
  Future<String> sendText(String text) async {
    try {
      final formData = FormData.fromMap({'text': text});

      final response = await _client.post('/lumen', data: formData);

      final raw = response.data;
      final data =
          raw is String
              ? jsonDecode(raw) as Map<String, dynamic>
              : raw as Map<String, dynamic>;

      return data['text']?.toString() ?? '';
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
