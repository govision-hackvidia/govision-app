import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsModel with _$NewsModel {
  const factory NewsModel({
    String? title,
    String? date,
    String? source,
    String? minutes,
    String? photo,
    String? highlightedText,
    String? desc,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
