import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/repositories/food_category_repository.dart';

import '../../../../core/usecase/usecase.dart';

class FoodCategoryGetAll implements UseCase<List<FoodCategory>, NoParam> {
  final FoodCategoryRepository repository;
  const FoodCategoryGetAll(this.repository);

  @override
  Future<Either<Failure, List<FoodCategory>>> call(Params) async {
    return await repository.getFoodCategories();
    //throw UnimplementedError();
  }
}
