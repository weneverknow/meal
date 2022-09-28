part of 'food_category_selected_bloc.dart';

abstract class FoodCategorySelectedEvent extends Equatable {}

class SelectFoodCategory extends FoodCategorySelectedEvent {
  final FoodCategory foodCategory;
  SelectFoodCategory(this.foodCategory);
  @override
  List<Object?> get props => [foodCategory];
}
