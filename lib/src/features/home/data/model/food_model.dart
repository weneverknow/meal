import 'package:meal/src/features/home/domain/entities/food.dart';

class FoodModel extends Food {
  const FoodModel(
      {required String id,
      required String name,
      required String category,
      String tag = '',
      required String image,
      String? ingredients1,
      String? measure1,
      String? ingredients2,
      String? measure2,
      String? ingredients3,
      String? measure3,
      String? ingredients4,
      String? measure4,
      String? ingredients5,
      String? measure5,
      String? desc})
      : super(
            id: id,
            name: name,
            category: category,
            tag: tag,
            image: image,
            ingredients1: ingredients1,
            measure1: measure1,
            ingredients2: ingredients2,
            measure2: measure2,
            ingredients3: ingredients3,
            measure3: measure3,
            ingredients4: ingredients4,
            measure4: measure4,
            ingredients5: ingredients5,
            measure5: measure5,
            desc: desc);

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      tag: json['strTags'] ?? '',
      image: json['strMealThumb'],
      ingredients1: json['strIngredient1'],
      measure1: json['strMeasure1'],
      ingredients2: json['strIngredient2'],
      measure2: json['strMeasure2'],
      ingredients3: json['strIngredient3'],
      measure3: json['strMeasure3'],
      ingredients4: json['strIngredient4'],
      measure4: json['strMeasure4'],
      ingredients5: json['strIngredient5'],
      measure5: json['strMeasure5'],
      desc: json['strInstructions']);
}
