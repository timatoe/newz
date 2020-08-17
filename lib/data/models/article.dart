import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String url;
  final String headline;

  Article(this.id, this.url, this.headline);

  @override
  List<Object> get props => [
        id,
        url,
        headline,
      ];

  static Article fromJson(dynamic json) {
    return Article(
      json['id'] as int, 
      json['url'], 
      json['headline'],
    );
  }
}
