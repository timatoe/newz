import 'package:equatable/equatable.dart';

class ArticleImage extends Equatable {
  final int id;
  final String url;

  ArticleImage(this.id, this.url);

  @override
  List<Object> get props => [
        id,
        url,
      ];

  static ArticleImage fromJson(dynamic json) {
    return ArticleImage(
      json['id'] as int,
      json['url'],
    );
  }
}
