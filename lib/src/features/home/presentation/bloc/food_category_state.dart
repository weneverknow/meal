part of 'food_category_bloc.dart';

abstract class FoodCategoryState extends Equatable {
  // const FoodCategoryState();

  // @override
  // List<Object> get props => [];
}

class FoodCategoryInitial extends FoodCategoryState {
  @override
  List<Object?> get props => [];
}

class FoodCategoryLoaded extends FoodCategoryState {
  final List<FoodCategory> categories;
  FoodCategoryLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}

class FoodCategoryFailure extends FoodCategoryState {
  @override
  List<Object?> get props => [];
}
