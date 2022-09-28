import 'package:dartz/dartz.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';

import '../../../../core/failure/failure.dart';
import '../../data/model/food_favourite.dart';
import '../entity/food_favourite.dart';

abstract class FavouriteFoodRepository {
  Future<Either<Failure, List<FoodFavourite>>> fetch();
  Future<Either<Failure, void>> insert(Food food);
  Future<Either<Failure, void>> delete(int id);
  Future<Either<Failure, FoodFavourite>> getFoodById(int id);
}
