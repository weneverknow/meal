import 'package:meal/src/features/home/domain/repositories/food_repository.dart';

import '../entities/food.dart';

class FoodGetAll {
  final FoodRepository repository;
  const FoodGetAll(this.repository);

  Future<List<Food>>? getAll() async {
    return await repository.getAll();
  }
}
