import 'package:equatable/equatable.dart';

class FoodFavourite extends Equatable {
  final int? id;
  final int? foodId;
  final String? name;
  final String? category;
  final String? tags;
  final String? image;

  FoodFavourite(
      {this.id, this.foodId, this.name, this.category, this.tags, this.image});

  @override
  List<Object?> get props => [id, foodId, name, category, tags, image];
}
