part of 'food_favourite_bloc.dart';

abstract class FoodFavouriteState extends Equatable {
  // const FoodFavouriteState();

  // @override
  // List<Object> get props => [];
}

class FoodFavouriteInitial extends FoodFavouriteState {
  @override
  List<Object?> get props => [];
}

class FoodFavouriteLoaded extends FoodFavouriteState {
  final List<FoodFavourite> favourites;
  FoodFavouriteLoaded(this.favourites);
  @override
  List<Object?> get props => [favourites];
}
