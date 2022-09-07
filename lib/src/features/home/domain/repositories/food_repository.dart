import 'package:meal/src/features/home/domain/entities/food.dart';

abstract class FoodRepository {
  Future<List<Food>> getAll();  
}
