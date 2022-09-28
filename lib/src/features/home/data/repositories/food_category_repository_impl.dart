import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/features/home/data/datasource/food_category_remote_data_source.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/repositories/food_category_repository.dart';

import '../../../../core/exception/exceptions.dart';

class FoodCategoryRepositoryImpl implements FoodCategoryRepository {
  final FoodCategoryRemoteDataSource remoteDataSource;
  const FoodCategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<FoodCategory>>> getFoodCategories() async {
    try {
      return Right(await remoteDataSource.getFoodCategories());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'something went wrong'));
    }
  }
}
