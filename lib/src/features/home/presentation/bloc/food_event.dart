part of 'food_bloc.dart';

@immutable
abstract class FoodEvent extends Equatable {}

class LoadFood extends FoodEvent {
  @override
  List<Object?> get props => [];
}
