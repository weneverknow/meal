import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/features/favourite_food/data/datasource/food_favourite_data_source.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';
import 'package:meal/src/features/favourite_food/domain/repository/favourite_food_repository.dart';

import '../../../home/domain/entities/food.dart';
import '../../domain/entity/food_favourite.dart';

class FoodFavouriteRepositoryImpl implements FavouriteFoodRepository {
  final FoodFavouriteDataSource dataSource;
  FoodFavouriteRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return Right(await dataSource.delete(id));
    } catch (e) {
      return Left(ServerFailure(message: 'something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<FoodFavourite>>> fetch() async {
    try {
      return Right(await dataSource.fetch());
    } catch (e) {
      return Left(ServerFailure(message: 'something went wrong'));
    }
  }

  @override
  Future<Either<Failure, FoodFavourite>> getFoodById(int id) async {
    try {
      return Right(await dataSource.getFoodById(id));
    } catch (e) {
      return Left(ServerFailure(message: 'something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> insert(Food food) async {
    try {
      return Right(await dataSource.insert(food));
    } catch (e) {
      return Left(ServerFailure(message: 'something went wrong'));
    }
  }

  // Future<List<FoodFavourite>> fetch() async {
  //   return await dataSource.fetch();
  // }

  // Future<void> insert(Food food) async {
  //   return await dataSource.insert(food);
  // }

  // Future<void> delete(int foodId) async {
  //   return await dataSource.delete(foodId);
  // }

  // Future<FoodFavourite?> getFoodById(int foodId) async {
  //   return await dataSource.getFoodById(foodId);
  // }
}
