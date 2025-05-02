import 'package:govision/data/data.dart';

mixin NewsRepository {
  Future<List<NewsModel>> getAllNews();
}
