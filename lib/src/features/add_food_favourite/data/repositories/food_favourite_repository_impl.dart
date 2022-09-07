import 'package:meal/src/features/add_food_favourite/data/datasource/food_favourite_data_source.dart';
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';

import '../../../home/domain/entities/food.dart';

class FoodFavouriteRepositoryImpl {
  final FoodFavouriteDataSource dataSource;
  FoodFavouriteRepositoryImpl(this.dataSource);

  Future<List<FoodFavourite>> fetch() async {
    return await dataSource.fetch();
  }

  Future<void> insert(Food food) async {
    return await dataSource.insert(food);
  }

  Future<void> delete(int foodId) async {
    return await dataSource.delete(foodId);
  }

  Future<FoodFavourite?> getFoodById(int foodId) async {
    return await dataSource.getFoodById(foodId);
  }
}
