import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/repositories/food_category_repository.dart';

class FoodCategoryGetAll {
  final FoodCategoryRepository repository;
  const FoodCategoryGetAll(this.repository);

  Future<List<FoodCategory>> getFoodCategories() async {
    return await repository.getFoodCategories();
  }
}
