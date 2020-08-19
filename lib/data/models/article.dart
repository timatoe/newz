import 'package:equatable/equatable.dart';
import 'package:newz/data/models/article_image.dart';

class Article extends Equatable {
  final int id;
  final String url;
  final String headline;
  final List<ArticleImage> images;

  Article(this.id, this.url, this.headline, this.images);

  @override
  List<Object> get props => [
        id,
        url,
        headline,
        images,
      ];

  static Article fromJson(dynamic json) {
    List<ArticleImage> images = [];
    final List<dynamic> articleImagesJson = json['relatedImages'];
    articleImagesJson.forEach((image) {
      images.add(ArticleImage.fromJson(image));
    });
    return Article(
      json['id'] as int,
      json['url'],
      json['headline'],
      images,
    );
  }
}
