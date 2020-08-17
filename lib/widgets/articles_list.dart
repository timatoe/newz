import 'package:flutter/material.dart';
import 'package:newz/data/models/article.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key key,
    this.onTap,
    this.articles = const <Article>[],
  }) : super(key: key);

  final ValueSetter<Article> onTap;
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) => _ArticleListItem(
        article: articles[index],
        onTap: () => onTap(articles[index]),
      ),
    );
  }
}

class _ArticleListItem extends StatelessWidget {
  const _ArticleListItem({
    Key key,
    this.article,
    this.onTap,
  }) : super(key: key);

  final Article article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      visualDensity: VisualDensity.compact,
      title: Text(article.headline),
      onTap: onTap,
    );
  }
}