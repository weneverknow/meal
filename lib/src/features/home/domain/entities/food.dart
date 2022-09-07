import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String name;
  final String category;
  final String image;
  final String? tag;
  final String? ingredients1;
  final String? measure1;
  final String? ingredients2;
  final String? measure2;
  final String? ingredients3;
  final String? measure3;
  final String? ingredients4;
  final String? measure4;
  final String? ingredients5;
  final String? measure5;
  final String? desc;

  const Food(
      {required this.id,
      required this.name,
      required this.category,
      required this.image,
      this.tag,
      this.ingredients1,
      this.measure1,
      this.ingredients2,
      this.measure2,
      this.ingredients3,
      this.measure3,
      this.ingredients4,
      this.measure4,
      this.ingredients5,
      this.measure5,
      this.desc});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      image: json['strMealThumb'],
      tag: json['strTags'],
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

  List<String> makeIngredients() => [
        ingredients1!,
        ingredients2!,
        ingredients3!,
        ingredients4!,
        ingredients5!
      ];
  List<String> makeMeasure() =>
      [measure1!, measure2!, measure3!, measure4!, measure5!];

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        image,
        tag,
        ingredients1,
        measure1,
        ingredients2,
        measure2,
        ingredients3,
        measure3,
        ingredients4,
        measure4,
        ingredients5,
        measure5,
        desc
      ];
}
