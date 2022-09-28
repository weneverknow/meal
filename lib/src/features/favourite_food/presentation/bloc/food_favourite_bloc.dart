import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';

import '../../domain/entity/food_favourite.dart';

part 'food_favourite_event.dart';
part 'food_favourite_state.dart';

class FoodFavouriteBloc extends Bloc<FoodFavouriteEvent, FoodFavouriteState> {
  FoodFavouriteBloc() : super(FoodFavouriteInitial()) {
    on<FoodFavouriteEvent>((event, emit) {
      // TODO: implement event handler
    });

    //on<AddFavouriteFood>(insert);
    on<LoadFavouriteFood>(loadFavouriteFood);
    on<AddFavouriteFood>(addFavouriteFood);
    on<DeleteFavouriteFood>(deleteFavouriteFood);
    on<ManageFavouriteFood>(manageFavouriteFood);
  }

  manageFavouriteFood(
      ManageFavouriteFood event, Emitter<FoodFavouriteState> emit) {
    if (state is FoodFavouriteInitial) {
      emit(FoodFavouriteLoaded([event.food]));
    } else {
      if ((state as FoodFavouriteLoaded)
          .favourites
          .any((element) => element.foodId == event.food.foodId)) {
        List<FoodFavourite> favs = (state as FoodFavouriteLoaded)
            .favourites
            .where((element) => element.foodId != event.food.foodId)
            .toList();
        emit(FoodFavouriteLoaded(favs));
      } else {
        List<FoodFavourite> favs =
            (state as FoodFavouriteLoaded).favourites + [event.food];
        emit(FoodFavouriteLoaded(favs));
      }
    }
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
