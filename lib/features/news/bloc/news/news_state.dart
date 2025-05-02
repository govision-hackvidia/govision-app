part of 'news_bloc.dart';

@freezed
sealed class NewsState with _$NewsState {
  const factory NewsState({
    @Default(AsyncValue<List<NewsModel>>.initial())
    AsyncValue<List<NewsModel>> news,
  }) = _NewsState;
}
