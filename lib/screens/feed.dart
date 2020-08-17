import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz/bloc/news_bloc.dart';
import 'package:newz/data/models/article.dart';
import 'package:newz/widgets/articles_list.dart';
import 'package:shimmer/shimmer.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Text('Newz', style: Theme.of(context).textTheme.headline4),
              const SizedBox(
                height: 16.0,
              ),
              Flexible(
                child: BlocConsumer<NewsBloc, NewsState>(
                  listenWhen: (previous, current) => previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == NewsStatus.failure) {
                      Scaffold.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              content: Text('Something\'s gone wrong...')),
                      );
                    }
                  },
                  builder: (context, state) {
                    switch (state.status) {
                      case NewsStatus.loading:
                        return _SearchLoading();
                      case NewsStatus.success:
                        return _SearchSuccess(articles: state.articles,);
                      default:
                        // TODO: Handle this better
                        return _SearchLoading();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class _SearchLoading extends StatelessWidget {
  const _SearchLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      key: const Key('loading_shimmer'),
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 48.0,
          color: Colors.white,
        ),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}

class _SearchSuccess extends StatelessWidget {
  const _SearchSuccess({Key key, @required this.articles}) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ArticlesList(
      articles: articles,
      onTap: (suggestion) {
        // TODO: go to detailed article page
      },
    );
  }
}
