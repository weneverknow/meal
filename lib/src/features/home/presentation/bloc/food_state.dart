part of 'food_bloc.dart';

@immutable
abstract class FoodState extends Equatable {}

class FoodInitial extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoading extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoaded extends FoodState {
  final List<Food> food;
  FoodLoaded(this.food);

  @override
  List<Object?> get props => [food];
}

class FoodFailure extends FoodState {
  @override
  List<Object?> get props => [];
}
