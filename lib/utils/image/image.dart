import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageUtils {
  static Future<XFile> smartCompress(
    XFile file, {
    bool isHazalert = true,
  }) async {
    final originalSize = await file.length();

    final xFile = await FlutterImageCompress.compressAndGetFile(
      file.path,
      '${file.path}_compressed.jpg',
      quality: originalSize > 2 * 1024 * 1024 ? 70 : 80,
      minWidth: isHazalert ? 640 : 1024,
      minHeight: isHazalert ? 480 : 768,
    );

    if (xFile != null) {
      return xFile;
    }

    throw Exception('Failed to compress image');
  }
}
