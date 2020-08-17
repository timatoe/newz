part of 'news_bloc.dart';

enum NewsStatus { loading, success, failure }

class NewsState extends Equatable {
  const NewsState._({
    this.status = NewsStatus.loading,
    this.articles = const <Article>[],
  });

  const NewsState.loading() : this._(status: NewsStatus.loading);

  const NewsState.success(List<Article> articles)
      : this._(status: NewsStatus.success, articles: articles);

  const NewsState.failure() : this._(status: NewsStatus.failure);

  final NewsStatus status;
  final List<Article> articles;

  @override
  List<Object> get props => [status, articles];
}