/*import 'dart:convert';

import 'serializers.dart';
import 'src/article.dart';

List<int> parseTopStories(String jsonStr) {
  return [];
  *//*final parsed = jsonDecode(jsonStr);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;*//*
}

Article parseArticle(String jsonStr) {
  final parsed = json.decode(jsonStr);
  return standardSerializers.deserializeWith(Article.serializer, parsed);
}*/
