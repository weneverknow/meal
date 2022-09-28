import 'package:equatable/equatable.dart';

class FoodCategory extends Equatable {
  final String id;
  final String name;
  final String? image;
  const FoodCategory(
      {required this.id, required this.name, required this.image});

 
  @override
  List<Object?> get props => [id, name, image];
}
