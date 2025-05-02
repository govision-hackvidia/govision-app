import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:govision/data/data.dart';
import 'package:govision/gen/assets.gen.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl();

  @override
  Future<List<NewsModel>> getAllNews() async {
    final jsonStr = await rootBundle.loadString(Assets.json.news);
    final jsonList = jsonDecode(jsonStr) as List<dynamic>;
    return jsonList
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
