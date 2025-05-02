import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:govision/core/bloc/async_value.dart';
import 'package:govision/data/models/news/news_model.dart';
import 'package:govision/data/repositories/local/news/news.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required NewsRepository repository})
    : _repository = repository,
      super(const NewsState()) {
    on<_GetAllNews>(_onGetAllNews);
  }

  late final NewsRepository _repository;

  Future<void> _onGetAllNews(_GetAllNews event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(news: const AsyncValue.loading()));
      final news = await _repository.getAllNews();
      emit(state.copyWith(news: AsyncValue.data(news)));
    } catch (e) {
      emit(state.copyWith(news: AsyncValue.error(e.toString())));
    }
  }
}
