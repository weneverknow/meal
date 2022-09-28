import 'package:dartz/dartz.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';

import '../../../../core/failure/failure.dart';

abstract class FoodCategoryRepository {
  Future<Either<Failure, List<FoodCategory>>> getFoodCategories();
}
