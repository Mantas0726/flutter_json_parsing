import 'dart:convert';

import 'package:boring_show_example/src/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

//  int get id;
//
//  @nullable
//  bool get deleted;
//
//  String get type;
//
  String get by;

//
//  int get time;
//
//  @nullable
//  String get text;
//
//  @nullable
//  bool get dead;
//
//  @nullable
//  int get parent;
//
//  @nullable
//  int get poll;
//
//  BuiltList<int> get kids;
//
//  String get url;
//
//  @nullable
//  int get score;
//
//  @nullable
//  String get title;
//
//  BuiltList<int> get parts;
//
//  @nullable
//  int get descendants;

  Article._();

  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

/*List<int> parseTopStories(String json){
  return [];
}*/

Article parseArticle(String jsonStr) {
  final parsed = json.decode(jsonStr);
  Article article =
      standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}
/*class Article {
  final String text;
  final String url;
  final String by;
  final int time;
  final int score;

  const Article({this.text, this.url, this.by, this.time, this.score});

  factory Article.fromJs(Map<String, dynamic> json) {
    if (json == null || json.isEmpty) return null;

    return Article(
      text: json['text'] ?? '[null]',
      url: json['url'],
      by: json['by'],
      time: json['time'] ?? 0,
      score: json['score'] ?? 0,
    );
  }
}*/
