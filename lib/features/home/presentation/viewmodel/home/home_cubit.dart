import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../model/category_model.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryModel> model = [];
  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    emit(HomeCategorySelectedState(newCategory));
  }

  void onDrawerClick() {
    selectedCategory = null;
    emit(HomeDrawerClosedState());
  }
}
