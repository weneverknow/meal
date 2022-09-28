import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/favourite_food/domain/repository/favourite_food_repository.dart';

class DeleteFavouriteFood implements UseCase<void, int> {
  final FavouriteFoodRepository repository;
  DeleteFavouriteFood(this.repository);
  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.delete(id);
  }
}
