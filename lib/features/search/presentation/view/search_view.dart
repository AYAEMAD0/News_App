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

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SearchNewsCubit>();
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
                    prefixIcon: Icon(Icons.search),
                    suffixIconColor: Theme.of(context).canvasColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.clearSearch();
                      },
                      icon: Icon(Icons.close),
                    ),
                    onChanged: viewModel.searchNews,
                  ),
                  SizedBox(height: 14.h),
                  Expanded(
                    child: () {
                      if (state is SearchNewsLoading) {
                        return const LoadingBaseWidget();
                      } else if (state is SearchNewsError) {
                        return ErrorBaseWidget(
                          message: state.errorMessage,
                          onPressed: () => viewModel.searchNews(
                            viewModel.searchController.text,
                          ),
                        );
                      } else if (state is SearchNewsSuccess) {
                        if (state.articles.isEmpty) {
                          return Center(
                            child: Text(
                              AppStrings.noResult,
                              style: Theme.of(context).textTheme.labelMedium!,
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) =>
                              NewsItem(articles: state.articles[index]),
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
