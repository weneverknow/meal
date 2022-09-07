import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/add_food_favourite/data/repositories/food_favourite_repository_impl.dart';

import '../../../home/domain/entities/food.dart';

part 'food_favourite_event.dart';
part 'food_favourite_state.dart';

class FoodFavouriteBloc extends Bloc<FoodFavouriteEvent, FoodFavouriteState> {
  final FoodFavouriteRepositoryImpl foodFavouriteRepositoryImpl;
  FoodFavouriteBloc({required this.foodFavouriteRepositoryImpl})
      : super(FoodFavouriteInitial()) {
    on<FoodFavouriteEvent>((event, emit) {
      // TODO: implement event handler
    });

    //on<AddFavouriteFood>(insert);
    on<LoadFavouriteFood>(loadFavouriteFood);
    on<AddFavouriteFood>(addFavouriteFood);
    on<DeleteFavouriteFood>(deleteFavouriteFood);
  }

  loadFavouriteFood(LoadFavouriteFood event, Emitter<FoodFavouriteState> emit) {
    emit(FoodFavouriteLoaded(event.favouriteFood));
  }

  addFavouriteFood(AddFavouriteFood event, Emitter<FoodFavouriteState> emit) {
    List<FoodFavourite> favs =
        (state as FoodFavouriteLoaded).favourites + [event.food];
    print("[FoodFavouriteBloc] addFavouriteFood $favs");
    emit(FoodFavouriteLoaded(favs));
  }

  deleteFavouriteFood(
      DeleteFavouriteFood event, Emitter<FoodFavouriteState> emit) {
    List<FoodFavourite> favs = (state as FoodFavouriteLoaded)
        .favourites
        .where((element) => element.id != event.id)
        .toList();
    emit(FoodFavouriteLoaded(favs));
  }
}
