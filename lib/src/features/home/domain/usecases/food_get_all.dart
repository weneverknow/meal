import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/home/domain/repositories/food_repository.dart';

import '../entities/food.dart';

class FoodGetAll implements UseCase<List<Food>, NoParam> {
  final FoodRepository repository;
  const FoodGetAll(this.repository);

  @override
  Future<Either<Failure, List<Food>>> call(Params) async {
    return await repository.getAll();
    //throw UnimplementedError();
  }
}
