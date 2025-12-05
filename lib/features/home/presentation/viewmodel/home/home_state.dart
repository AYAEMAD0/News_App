part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeCategorySelectedState extends HomeState {
  final CategoryModel category;
  HomeCategorySelectedState(this.category);
}

class HomeDrawerClosedState extends HomeState {}
