import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/favourite_food/domain/repository/favourite_food_repository.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';

class InsertFavouriteFood implements UseCase<void, Food> {
  final FavouriteFoodRepository repository;
  InsertFavouriteFood(this.repository);
  @override
  Future<Either<Failure, void>> call(Food food) async {
    return await repository.insert(food);
  }
}
