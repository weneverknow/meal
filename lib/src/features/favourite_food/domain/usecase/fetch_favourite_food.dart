import 'package:meal/src/core/failure/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/model/food_favourite.dart';
import '../entity/food_favourite.dart';
import '../repository/favourite_food_repository.dart';

class FetchFavouriteFood implements UseCase<List<FoodFavourite>, NoParam> {
  final FavouriteFoodRepository repository;
  FetchFavouriteFood(this.repository);
  @override
  Future<Either<Failure, List<FoodFavourite>>> call(NoParam params) async {
    return await repository.fetch();
  }
}
