import 'package:newz/data/models/article.dart';
import 'package:newz/data/remote/news_api_client.dart';

class NewsRepository {
  final NewsApiClient newsApiClient;

  NewsRepository(this.newsApiClient) : assert(newsApiClient != null);

  Future<List<Article>> getArticles() async {
    return newsApiClient.fetchArticles();
  }
}
