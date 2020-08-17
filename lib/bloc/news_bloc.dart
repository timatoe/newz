import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newz/data/models/article.dart';
import 'package:newz/data/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._newsRepository)
      : assert(_newsRepository != null),
        super(const NewsState.loading());

  final NewsRepository _newsRepository;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is RequestArticles) {
      yield const NewsState.loading();
      try {
        final List<Article> articles = await _newsRepository.getArticles();
        yield NewsState.success(articles);
      } catch (_) {
        print('errororooror');
        yield const NewsState.failure();
      }
    }
  }
}
