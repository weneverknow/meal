import 'package:meal/src/features/home/domain/entities/food_category.dart';

abstract class FoodCategoryRepository {
  Future<List<FoodCategory>> getFoodCategories();
}
