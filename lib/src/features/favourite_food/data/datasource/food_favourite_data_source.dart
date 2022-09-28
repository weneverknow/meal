import 'package:drift/drift.dart';
import 'package:meal/src/core/config/my_db.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';

import '../../domain/entity/food_favourite.dart';

abstract class FoodFavouriteDataSource {
  Future<List<FoodFavourite>> fetch();
  Future<void> insert(Food food);
  Future<void> delete(int foodId);
  Future<FoodFavourite> getFoodById(int foodId);
}

class FoodFavouriteDataSourceImpl implements FoodFavouriteDataSource {
  final MyDatabase database = MyDb.mydb!;
  //FoodFavouriteDataSourceImpl(this.database);
  @override
  Future<List<FoodFavourite>> fetch() async {
    final allFoodFavourite =
        await database.select(database.foodFavourites).get();
    return allFoodFavourite;
  }

  @override
  Future<void> insert(Food food) async {
    final save = await database.into(database.foodFavourites).insert(
        FoodFavouritesCompanion.insert(
            foodId: int.tryParse(food.id) ?? 0,
            name: food.name,
            category: food.category,
            image: Value(food.image),
            tags: Value(food.tag)));
  }

  @override
  Future<void> delete(int foodId) async {
    print("[FoodFavouriteDataSourceImpl] delete food id $foodId");
    final del = await (database.delete(database.foodFavourites)
          ..where((tbl) => tbl.foodId.equals(foodId)))
        .go();
    print("deleted $del");
  }

  @override
  Future<FoodFavourite> getFoodById(int foodId) async {
    return await (database.select(database.foodFavourites)
          ..where((tbl) => tbl.foodId.equals(foodId)))
        .getSingle();
  }
}
