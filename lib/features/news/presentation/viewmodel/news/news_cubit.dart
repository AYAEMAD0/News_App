import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/news/articles.dart';
import 'package:news_app/domain/usecase/news_usecase.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/exceptions/app_exception.dart';
import 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsUseCase newsUseCase;

  NewsCubit({required this.newsUseCase}) : super(NewsInitialState());

  List<Articles> articles = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  Future<void> getNewsBySourceId(String sourceId, {bool reset = false}) async {
    if (isLoading) return;

    if (reset) {
      articles = [];
      page = 1;
      hasMore = true;
    }

    if (!hasMore && !reset) return;

    isLoading = true;

    if (page == 1) {
      emit(NewsLoadingState());
    } else {
      emit(NewsPaginationLoadingState());
    }

    try {
      final response = await newsUseCase.call(
        sourceId,
        page: page,
        pageSize: 10,
      );

      if (response.status == 'ok') {
        final newArticles = response.articles ?? [];

        if (newArticles.isEmpty) {
          hasMore = false;
        } else {
          articles.addAll(newArticles);
          hasMore = newArticles.length >= 10;
          page++;
        }

        emit(
          NewsSuccessState(
            articleList: List<Articles>.from(articles),
            hasMore: hasMore,
          ),
        );
      } else {
        emit(
          NewsErrorState(
            errorMessage: response.status ?? AppStrings.somethingWentWrong,
          ),
        );
      }
    } catch (e) {
      if (e is AppException) {
        emit(NewsErrorState(errorMessage: e.message));
      } else {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    } finally {
      isLoading = false;
    }
  }

  void reset() {
    articles = [];
    page = 1;
    hasMore = true;
    isLoading = false;
  }
}
