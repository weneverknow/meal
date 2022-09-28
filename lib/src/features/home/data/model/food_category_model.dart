import '../../domain/entities/food_category.dart';

class FoodCategoryModel extends FoodCategory {
  FoodCategoryModel(
      {required super.id, required super.name, required super.image});

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) =>
      FoodCategoryModel(
          id: json['idCategory'],
          name: json['strCategory'],
          image: json['strCategoryThumb']);
}
