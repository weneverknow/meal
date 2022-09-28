import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/features/home/data/datasource/food_remote_data_source.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';
import 'package:meal/src/features/home/domain/repositories/food_repository.dart';

import '../../../../core/exception/exceptions.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  const FoodRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Food>>> getAll() async {
    try {
      return Right(await remoteDataSource.getAll());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
