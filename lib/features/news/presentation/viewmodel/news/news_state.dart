import 'package:news_app/domain/entities/news/articles.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsPaginationLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<Articles> articleList;
  final bool hasMore;

  NewsSuccessState({required this.articleList, this.hasMore = true});

  NewsSuccessState copyWith({
    List<Articles>? articleList,
    bool? hasMore,
  }) {
    return NewsSuccessState(
      articleList: articleList ?? this.articleList,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class NewsErrorState extends NewsState {
  String? errorMessage;

  NewsErrorState({required this.errorMessage});
}
