part of 'food_favourite_bloc.dart';

abstract class FoodFavouriteEvent extends Equatable {}

class LoadFavouriteFood extends FoodFavouriteEvent {
  final List<FoodFavourite> favouriteFood;
  LoadFavouriteFood(this.favouriteFood);
  @override
  List<Object?> get props => [favouriteFood];
}

class AddFavouriteFood extends FoodFavouriteEvent {
  final FoodFavourite food;
  AddFavouriteFood(this.food);
  @override
  List<Object?> get props => [food];
}

class DeleteFavouriteFood extends FoodFavouriteEvent {
  final int id;
  DeleteFavouriteFood(this.id);
  @override
  List<Object?> get props => [id];
}

class ManageFavouriteFood extends FoodFavouriteEvent {
  final FoodFavourite food;
  ManageFavouriteFood(this.food);
  @override
  // TODO: implement props
  List<Object?> get props => [food];
}
