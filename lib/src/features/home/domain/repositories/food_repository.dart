import 'package:meal/src/core/failure/failure.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';
import 'package:dartz/dartz.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<Food>>> getAll();
}
