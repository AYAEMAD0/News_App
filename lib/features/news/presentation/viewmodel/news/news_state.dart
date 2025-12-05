import 'package:news_app/domain/entities/news/articles.dart';

abstract class NewsState {}

class InitialState extends NewsState {}

class LoadingState extends NewsState {}

class PaginationLoadingState extends NewsState {}

class SuccessState extends NewsState {
  final List<Articles> articleList;
  final bool hasMore;

  SuccessState({required this.articleList, this.hasMore = true});
  SuccessState copyWith({
    List<Articles>? articleList,
    bool? hasMore,
  }) {
    return SuccessState(
      articleList: articleList ?? this.articleList,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class ErrorState extends NewsState {
  String? errorMessage;
  ErrorState({required this.errorMessage});
}
