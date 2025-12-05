import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/di.dart';
import '../../../../core/widgets/error_api_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../domain/entities/source/sources.dart';
import '../viewmodel/news/news_cubit.dart';
import '../viewmodel/news/news_state.dart';
import '../widget/news_item.dart';


class NewsWidget extends StatefulWidget {
  final Sources source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}
class _NewsWidgetState extends State<NewsWidget> {
  NewsCubit viewModel = getIt<NewsCubit>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!viewModel.isLoading &&
        scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 &&
        viewModel.hasMore) {
      viewModel.getNewsBySourceId(widget.source.id!);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingWidget();
        } else if (state is ErrorState) {
          return ErrorApiWidget(
            onPressed: () {
              viewModel.reset();
              viewModel.getNewsBySourceId(widget.source.id!, reset: true);
            },
            message: state.errorMessage.toString(),
          );
        } else if (state is SuccessState || state is PaginationLoadingState) {
          final articles = state is SuccessState
              ? state.articleList
              : viewModel.articles;
          final hasMore = state is SuccessState
              ? state.hasMore
              : viewModel.hasMore;

          return ListView.builder(
            padding: EdgeInsets.only(top: 5.h),
            controller: scrollController,
            itemCount: hasMore ? articles.length + 1 : articles.length,
            itemBuilder: (context, index) {
              if (index < articles.length) {
                return NewsItem(articles: articles[index]);
              } else {
                return Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
