import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';

import '../entity/food_favourite.dart';
import '../repository/favourite_food_repository.dart';

class GetFoodById implements UseCase<FoodFavourite, int> {
  final FavouriteFoodRepository repository;
  GetFoodById(this.repository);
  @override
  Future<Either<Failure, FoodFavourite>> call(int id) async {
    return await repository.getFoodById(id);
  }
}
