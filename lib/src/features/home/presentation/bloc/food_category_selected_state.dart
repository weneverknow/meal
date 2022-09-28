part of 'food_category_selected_bloc.dart';

abstract class FoodCategorySelectedState extends Equatable {}

class FoodCategorySelectedInitial extends FoodCategorySelectedState {
  @override
  List<Object?> get props => [];
}

class FoodCategorySelected extends FoodCategorySelectedState {
  final FoodCategory foodCategory;
  FoodCategorySelected(this.foodCategory);
  @override
  List<Object?> get props => [foodCategory];
}
