import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'src/article.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [
    8863,
  ];

/*  Future<Article> _getArticle(int id) async {
//    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyUrl = 'http://94.176.239.114/123';
    print("--> $storyUrl");
    final storyResponse = await http.get(storyUrl);

    Article article;
    if (storyResponse.statusCode == 200) {
      print("<-- $storyUrl ${storyResponse.headers}");
      article = parseArticle(storyResponse.body);
    }
    return article;
  }*/

 Future<Article> _getArticle(int id){
   String response = '{"by":"Flutter"}';
   Article article = parseArticle(response);
   return Future.value(article);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
            children: _ids.map((i) =>
                FutureBuilder<Article>(
                    future: _getArticle(i),
                    builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        else
                          return new Text('Result: ${snapshot.data}');
//                        return Text(snapshot.data.title);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })
            )
                .toList()));
  }
}
