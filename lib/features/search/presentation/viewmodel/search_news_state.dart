part of 'search_news_cubit.dart';

sealed class SearchNewsState {}

final class SearchNewsInitial extends SearchNewsState {}

final class SearchNewsLoading extends SearchNewsState {}

final class SearchNewsSuccess extends SearchNewsState {
  final List<Articles> articles;

  SearchNewsSuccess({required this.articles});
}

final class SearchNewsError extends SearchNewsState {
  final String errorMessage;

  SearchNewsError({required this.errorMessage});
}
