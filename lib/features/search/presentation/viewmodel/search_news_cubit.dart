import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/domain/usecase/search_news_usecase.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../domain/entities/news/articles.dart';

part 'search_news_state.dart';

@injectable
class SearchNewsCubit extends Cubit<SearchNewsState> {
  final SearchNewsUseCase searchNewsUseCase;

  SearchNewsCubit({required this.searchNewsUseCase})
    : super(SearchNewsInitial());

  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query
          .trim()
          .isEmpty) {
        clearSearch();
      } else {
        searchNews(query.trim());
      }
    });
  }

  Future<void> searchNews(String query) async {
    if (isLoading) return;

    query = query.trim();

    if (query.isEmpty) {
      emit(SearchNewsInitial());
      return;
    }

    isLoading = true;
    emit(SearchNewsLoading());

    try {
      final response = await searchNewsUseCase.call(query: query);

      if (response.status == 'ok') {
        final List<Articles> articles = response.articles ?? [];

        if (articles.isEmpty) {
          emit(SearchNewsSuccess(articles: []));
        } else {
          emit(SearchNewsSuccess(articles: articles));
        }
      } else {
        emit(SearchNewsError(
          errorMessage: response.status ?? AppStrings.somethingWentWrong,
        ));
      }
    } catch (e) {
      if (e is AppException) {
        emit(SearchNewsError(errorMessage: e.message));
      } else {
        emit(SearchNewsError(errorMessage: e.toString()));
      }
    } finally {
      isLoading = false;
    }
  }

  void clearSearch() {
    searchController.clear();
    isLoading = false;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    emit(SearchNewsInitial());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    searchController.dispose();
    return super.close();
  }
}