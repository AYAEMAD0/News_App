import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/domain/usecase/search_news_usecase.dart';

import '../../../../domain/entities/news/articles.dart';

part 'search_news_state.dart';

@injectable
class SearchNewsCubit extends Cubit<SearchNewsState> {
  final SearchNewsUseCase searchNewsUseCase;
  final TextEditingController searchController = TextEditingController();

  SearchNewsCubit({required this.searchNewsUseCase})
    : super(SearchNewsInitial());

  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      emit(SearchNewsInitial());
      return;
    }
    emit(SearchNewsLoading());

    try {
      final response = await searchNewsUseCase.call(query: query);
      if (response.status == 'ok') {
        emit(SearchNewsSuccess(articles: response.articles ?? []));
      } else {
        emit(
          SearchNewsError(
            errorMessage: response.status ?? AppStrings.somethingWentWrong,
          ),
        );
      }
    } catch (e) {
      emit(SearchNewsError(errorMessage: e.toString()));
    }
  }

  void clearSearch() {
    searchController.clear();
    emit(SearchNewsInitial());
  }
}
