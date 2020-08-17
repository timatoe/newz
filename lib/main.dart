import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz/bloc/news_bloc.dart';
import 'package:newz/bloc/simple_bloc_observer.dart';
import 'package:newz/data/news_repository.dart';
import 'package:newz/data/remote/news_api_client.dart';
import 'package:newz/screens/feed.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsRepository newsRepository = NewsRepository(
      NewsApiClient(httpClient: http.Client())
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => NewsBloc(newsRepository)..add(RequestArticles()),
        child: FeedScreen(),
      ),
    );
  }
}
