import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../model/category_model.dart';
import '../../viewmodel/home/home_cubit.dart';
import '../../viewmodel/theme_provider/theme_provider.dart';
import 'widget/category_item.dart';

class CategoryFragmentView extends StatefulWidget {
   const CategoryFragmentView({super.key});

  @override
  State<CategoryFragmentView> createState() => _CategoryFragmentViewState();
}

class _CategoryFragmentViewState extends State<CategoryFragmentView> {
  List<CategoryModel> model = [];

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    var cubit = context.watch<HomeCubit>();
    model = CategoryModel.getCategoryList(theme.isDark());
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:16.w,
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.goodMorning,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top:12.h),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    cubit.onCategoryItemClick(model[index]);
                  },
                  child: CategoryItem(model: model[index], index: index),
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10.h),
                itemCount: model.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
