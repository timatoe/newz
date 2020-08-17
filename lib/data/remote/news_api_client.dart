import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:newz/data/models/article.dart';

class NewsApiClient {
  static const baseUrl =
      'https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full';
  final http.Client httpClient;

  NewsApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Article>> fetchArticles() async {
    final articlesUrl = '$baseUrl';
    final articleResponse = await this.httpClient.get(articlesUrl);

    if (articleResponse.statusCode != 200) {
      throw Exception('error getting articles');
    }
    List<Article> articles = [];
    final List<dynamic> articlesJson =
        jsonDecode(articleResponse.body)['assets'];
    articlesJson.forEach((article) {
      articles.add(Article.fromJson(article));
    });
    return articles;
  }
}
