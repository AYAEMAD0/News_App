import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/config/di.dart';
import 'package:news_app/features/home/presentation/viewmodel/home/home_cubit.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../news/presentation/view/category_details_view.dart';
import '../widget/drawer_widget.dart';
import 'category_fragment/category_fragment_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final viewModel = context.watch<HomeCubit>();
          final selectedCategory = viewModel.selectedCategory;
          return Scaffold(
            drawer: Drawer(
              backgroundColor: AppColors.primaryDark,
              child: DrawerWidget(
                onDrawerClick: () {
                  viewModel.onDrawerClick();
                  Navigator.pop(context);
                },
              ),
            ),
            appBar: AppBar(
              title: Text(
                selectedCategory == null
                    ? AppStrings.home
                    : selectedCategory.title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              actions: [
                selectedCategory == null
                    ? SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: IconButton(
                          onPressed: () {
                            //todo search
                            Navigator.pushNamed(
                              context,
                              Routes.searchRouteName,
                            );
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
              ],
            ),

            body: selectedCategory == null
                ? CategoryFragmentView()
                : CategoryDetailsView(category: selectedCategory),
          );
        },
      ),
    );
  }
}
