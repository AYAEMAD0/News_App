import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/config/di.dart';
import 'package:news_app/core/widgets/loading_base_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/error_base_widget.dart';
import '../../../news/presentation/widget/news_item.dart';
import '../viewmodel/search_news_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final viewModel = getIt<SearchNewsCubit>();

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNewsCubit, SearchNewsState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                children: [
                  CustomTextField(
                    textStyle: Theme.of(context).textTheme.labelMedium!,
                    hint: AppStrings.search,
                    hintStyle: Theme.of(context).textTheme.labelMedium!,
                    controller: viewModel.searchController,
                    borderColor: Theme.of(context).canvasColor,
                    fillColor: Theme.of(context).dividerColor,
                    prefixIconColor: Theme.of(context).canvasColor,
                    prefixIcon: const Icon(Icons.search),
                    suffixIconColor: Theme.of(context).canvasColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.clearSearch();
                      },
                      icon: const Icon(Icons.close),
                    ),
                    onChanged: (e) {
                      viewModel.onSearchChanged(e);
                    },
                  ),

                  SizedBox(height: 14.h),
                  Expanded(
                    child: () {
                      if (state is SearchNewsLoading) {
                        return const LoadingBaseWidget();
                      }
                      if (state is SearchNewsInitial) {
                        return Center(
                          child: Text(AppStrings.noSearch, style: Theme
                              .of(context)
                              .textTheme
                              .labelMedium,),
                        );
                      }
                      if (state is SearchNewsError) {
                        return ErrorBaseWidget(
                          message: state.errorMessage,
                          onPressed: () =>
                              viewModel.searchNews(
                                viewModel.searchController.text,),
                        );
                      }

                      if (state is SearchNewsSuccess) {
                        final articles = state.articles;

                        if (articles.isEmpty) {
                          return Center(
                            child: Text(
                              AppStrings.noResult,
                              style: Theme.of(context).textTheme.labelMedium!,
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return NewsItem(
                              articles: articles[index],
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    }(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
